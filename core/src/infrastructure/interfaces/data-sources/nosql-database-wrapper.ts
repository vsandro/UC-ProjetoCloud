export interface NoSQLDatabaseWrapper {
    insertOne(doc: any): void
    find(query: object): Promise<any[]>
    updateOne(id: String, data: object): void
    deleteOne(id: String): void    
}