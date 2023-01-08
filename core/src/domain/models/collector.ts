export interface CollectorRequestModel {
    latitude: number;
    longitude: number;
    address: string;
    status: string;
}
export interface CollectorResponseModel {
    id: string;
    latitude: number;
    longitude: number;
    address: string;
    status: string;
}