import { useParams } from "react-router";
import { useCallback, useState, useEffect } from "react";
import { getTodo } from "../../../apis/todo";
import { Todo } from "../../../apis/generated/api";

export const useTodoDetailTemplate = () => {
  const { id } = useParams();
  const [todo, setTodo] = useState<Todo | null>(null);

  const fetchTodo = useCallback(async () => {
    if (!id) return;
    const response = await getTodo(id);
    if (!response.data) return;
    setTodo(response.data);
  }, [id]);

  useEffect(() => {
    fetchTodo();
  }, [fetchTodo]);

  return { todo };
};
