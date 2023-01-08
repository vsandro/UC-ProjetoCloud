export interface Event_recordsRequestModel {
    collector_id: string;
    event_id: string;
    registration_date: string;
    description: string;
    status: string;
    close_date: string;
}
export interface Event_recordsResponseModel {
    id: string;
    collector_id: string;
    event_id: string;
    registration_date: string;
    description: string;
    status: string;
    close_date: string;
}
