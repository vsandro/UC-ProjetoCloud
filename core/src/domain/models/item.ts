export interface ItemRequestModel {
    description: string;
    category_id: string;
    active: boolean;
    reserved: boolean;
}
export interface ItemResponseModel {
    id: string;
    description: string;
    category_id: string;
    active: boolean;
    reserved: boolean;
}