import { ReactNode, createContext, FC } from "react";

import { useAuth } from "../hooks/useAuth";
import { User } from "../apis/generated/api";

type AuthContextProps = {
  children: ReactNode;
};

type AuthContextType = {
  user: User | null;
  isAuth: boolean;
  signIn: (user: User, token: string) => void;
  signOut: () => void;
};

const AuthContext = createContext<AuthContextType>({
  user: null,
  isAuth: false,
  signIn: () => {},
  signOut: () => {},
});

export { AuthContext };

export const AuthProvider: FC<AuthContextProps> = ({ children }) => {
  const { user, isAuth, signIn, signOut } = useAuth();
  return (
    <AuthContext.Provider value={{ user, isAuth, signIn, signOut }}>
      {children}
    </AuthContext.Provider>
  );
};
