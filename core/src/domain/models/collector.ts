export interface CollectorRequestModel {
    latitude: number;
    longitude: number;
    address: string;
    id_city: number;
    status: string;
}
export interface CollectorResponseModel {
    id: string;
    latitude: number;
    longitude: number;
    address: string;
    id_city: number;
    status: string;
}