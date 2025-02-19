import {
  isAxiosError,
  loginApi,
  registerApi,
  authenticationApi,
} from "./globalAxios";

import { IErrorResponse, ResponseType } from "../types/ApiResponse";

export const login = async (email: string, password: string) => {
  try {
    const response = await loginApi.loginLogin({
      email,
      password,
    });
    const res = {
      code: response.status,
      data: response.data,
    };

    return res;
  } catch (error) {
    const res: ResponseType = {
      code: 500,
      data: undefined,
      message: error as string,
    };
    if (isAxiosError(error)) {
      const axiosError = error as IErrorResponse;
      res.code = axiosError.response.status;
      res.message = axiosError.response.data.message;
    }
    return res;
  }
};

export const register = async (
  name: string,
  email: string,
  password: string
) => {
  try {
    const response = await registerApi.registerSignup({
      name,
      email,
      password,
    });

    const res = {
      code: response.status,
      data: response.data,
    };
    return res;
  } catch (error) {
    const res: ResponseType = {
      code: 500,
      message: error as string,
    };
    if (isAxiosError(error)) {
      const axiosError = error as IErrorResponse;
      res.code = axiosError.response.status;
      res.message = axiosError.response.data.message;
    }
    return res;
  }
};

export const checkAuthentication = async () => {
  try {
    const response = await authenticationApi.authenticationAuthentication();
    const res = {
      code: response.status,
      data: response.data,
    };
    return res;
  } catch (error) {
    const res: ResponseType = {
      code: 500,
      message: error as string,
    };
    if (isAxiosError(error)) {
      const axiosError = error as IErrorResponse;
      res.code = axiosError.response.status;
      res.message = axiosError.response.data.message;
    }
    return res;
  }
};
