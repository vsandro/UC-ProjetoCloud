export interface StoreRequestModel {
    name: string;
    address: string;
    latitude: number;
    longitude: number;    
    active: boolean;
}
export interface StoreResponseModel {
    id: string;
    name: string;
    address: string;
    latitude: number;
    longitude: number;    
    active: boolean;
}