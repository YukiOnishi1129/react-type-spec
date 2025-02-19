import axios, { AxiosError } from "axios";
import {
  Configuration,
  LoginApi,
  TodosApi,
  RegisterApi,
  AuthenticationApi,
} from "./generated";

const BASE_API_URL = import.meta.env.VITE_REACT_APP_API_URL;

const getToken = () => {
  const token = localStorage.getItem("authentication")
    ? localStorage.getItem("authentication")
    : "";

  return token || "";
};

const config = new Configuration({
  basePath: BASE_API_URL,
});

const apiClient = axios.create({
  baseURL: BASE_API_URL,
  headers: {
    "Content-Type": "application/json",
  },
});

apiClient.interceptors.request.use(
  (config) => {
    const token = getToken();
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

export const setAxiosAuthentication = (token: string) => {
  localStorage.setItem("authentication", token);
  apiClient.defaults.headers.Authorization = `Bearer ${token}`;
};

export const removeAxiosAuthentication = () => {
  localStorage.removeItem("authentication");
  delete apiClient.defaults.headers.Authorization;
};

export const todoApi = new TodosApi(config, "", apiClient);

export const loginApi = new LoginApi(config, "", apiClient);

export const registerApi = new RegisterApi(config, "", apiClient);

export const authenticationApi = new AuthenticationApi(config, "", apiClient);

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const isAxiosError = (error: any): error is AxiosError =>
  !!error.isAxiosError;
