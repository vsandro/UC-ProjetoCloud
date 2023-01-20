import amqp, { Message } from 'amqplib/callback_api'

const createMQConsumer = (amqpURl: string, queueName: string) => {
  console.log('Connecting to RabbitMQ...')
  return () => {
    amqp.connect(amqpURl, (errConn, conn) => {
      if (errConn) {
        throw errConn
      }

      conn.createChannel((errChan, chan) => {
        if (errChan) {
          throw errChan
        }

        console.log('Connected to RabbitMQ')
        chan.assertQueue(queueName, { durable: false })
        chan.consume(queueName, (msg: Message | null) => {
          if (msg) {
            const parsed = JSON.parse(msg.content.toString())

            console.log(queueName)
            console.log(parsed)

            const POSTGRES_USER = String(process.env.POSTGRES_USER);
            const POSTGRES_PASSWORD = String(process.env.POSTGRES_PASSWORD);    
            const POSTGRES_DB = process.env.POSTGRES_DB;
            const DB_HOST = String(process.env.DB_HOST);
            const DB_PORT = Number(process.env.DB_PORT);
        
            const { Client } = require('pg');
            const client = new Client({
                user: POSTGRES_USER,
                host: DB_HOST,
                database: POSTGRES_DB,
                password: POSTGRES_PASSWORD,
                port: DB_PORT,
            });
        
            client.connect();
            let query;
          
            switch (queueName) {
              case 'core.collectors':
                if (parsed.type === 'collector created') {
                  query = `insert into ${POSTGRES_DB + ".collectors"} (id, address, latitude, longitude, id_city, status) values ('${parsed.id}', '${parsed.address}', '${parsed.latitude}', '${parsed.longitude}', '${parsed.id_city}', '${parsed.status}')`;
                }                 
                if (parsed.type === 'collector updated') {
                  query = `update ${POSTGRES_DB + ".collectors"} set address = '${parsed.address}', latitude = '${parsed.latitude}', longitude = '${parsed.longitude}', id_city = '${parsed.id_city}', status = '${parsed.status}' where id = '${parsed.id}'`;
                }
                if (parsed.type === 'collector deleted') {
                  query = `delete from ${POSTGRES_DB + ".collectors"}  where id = '${parsed.id}'`;
                }                              
                break
              case 'core.stores':
                if (parsed.type === 'store created') {
                  query = `insert into ${POSTGRES_DB + ".stores"} (id, name, address, latitude, longitude, id_city) values ('${parsed.id}', '${parsed.name}', '${parsed.address}', '${parsed.latitude}', '${parsed.longitude}', '${parsed.id_city}')`;
                }                 
                if (parsed.type === 'store updated') {
                  query = `update ${POSTGRES_DB + ".stores"} set name = '${parsed.name}', address = '${parsed.address}', latitude = '${parsed.latitude}', longitude = '${parsed.longitude}', id_city = '${parsed.id_city}', active = '${parsed.active}' where id = '${parsed.id}'`;
                }
                if (parsed.type === 'store deleted') {
                  query = `delete from ${POSTGRES_DB + ".stores"}  where id = '${parsed.id}'`;
                }                              
                break
              case 'core.items':
                if (parsed.type === 'item created') {
                  query = `insert into ${POSTGRES_DB + ".items"} (id, description, category_id, active, reserved) values ('${parsed.id}', '${parsed.description}', '${parsed.category_id}', true, false)`;
                }                 
                if (parsed.type === 'item updated') {
                  query = `update ${POSTGRES_DB + ".items"} set description = '${parsed.description}', category_id = '${parsed.category_id}', active = '${parsed.active}', reserved = '${parsed.reserved}' where id = '${parsed.id}'`;
                }
                if (parsed.type === 'item deleted') {
                  query = `delete from ${POSTGRES_DB + ".items"}  where id = '${parsed.id}'`;
                }                                  
                break
                case 'core.categories':
                  if (parsed.type === 'category created') {
                    query = `insert into ${POSTGRES_DB + ".categories"} (id, name, active) values ('${parsed.id}', '${parsed.name}', true)`;
                  }                 
                  if (parsed.type === 'category updated') {
                    query = `update ${POSTGRES_DB + ".categories"} set name = '${parsed.name}', active = '${parsed.active}' where id = '${parsed.id}'`;
                  }
                  if (parsed.type === 'category deleted') {
                    query = `delete from ${POSTGRES_DB + ".categories"}  where id = '${parsed.id}'`;
                  }                              
                  break                
              default:
                break
            }           
            
            console.log(query)

            client.query(query, (err:any, result:any) => {
                if (err) {
                    console.error(err);
                    return;
                }          
                client.end();
            });                

          }
        }, { noAck: true })
      })
    })
  }
}

export default createMQConsumer