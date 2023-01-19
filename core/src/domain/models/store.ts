export interface StoreRequestModel {
    name: string;
    address: string;
    latitude: number;
    longitude: number;  
    id_city: number;   
    active: boolean;
}
export interface StoreResponseModel {
    id: string;
    name: string;
    address: string;
    latitude: number;
    longitude: number; 
    id_city: number;   
    active: boolean;
}