import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
type User = PrismaClient["user"];

export type SignUpWithUsernameAndPasswordResult = {
  token: string;
  user: User;
};

export enum SignUpWithUsernameAndPasswordError {
  CONFLICTING_USERNAME = "CONFLICTING_USERNAME",
  UNKNOWN = "UNKNOWN",
}

export type LogInWithUsernameAndPasswordResult = {
  token: string;
  user: User;
};

export enum LogInWithUsernameAndPasswordError {
  INCORRECT_USERNAME_OR_PASSWORD = "INCORRECT_USERNAME_OR_PASSWORD",
  UNKNOWN = "UNKNOWN",
}