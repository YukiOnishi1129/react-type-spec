import { isAxiosError, todoApi } from "./globalAxios";
import { CreateTodoRequest, UpdateTodoRequest } from "./generated/api";
import { IErrorResponse, ResponseType } from "../types/ApiResponse";

export const getTodos = async () => {
  try {
    const response = await todoApi.todosList();

    const res = {
      code: response.status,
      data: response.data.todos,
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

export const getTodo = async (id: string) => {
  try {
    const response = await todoApi.todosRead(id);
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

export const createTodo = async (request: CreateTodoRequest) => {
  try {
    const response = await todoApi.todosCreate(request);
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

export const updateTodo = async (id: string, request: UpdateTodoRequest) => {
  try {
    const response = await todoApi.todosUpdate(id, request);
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

export const deleteTodo = async (id: string) => {
  try {
    await todoApi.todosDelete(id);
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
