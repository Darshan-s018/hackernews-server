import { Hono } from "hono";
import { authenticationRoutes } from "./authentication-routes.ts";
import { usersRoutes } from "./users-routes.ts";
import { postsRoutes } from "./posts-routes.ts";
import { likesRoutes } from "./likes-routes.ts";
import { commentsRoutes } from "./comments-routes.ts";
import { logger } from "hono/logger";
export const allRoutes = new Hono();
allRoutes.use(logger());
allRoutes.route("/auth", authenticationRoutes);
allRoutes.route("/users", usersRoutes);
allRoutes.route("/posts", postsRoutes);
allRoutes.route("/likes", likesRoutes);
allRoutes.route("/comments", commentsRoutes);
allRoutes.get("/health", (context) => {
  return context.json({ message: "All Ok" }, 200);
});