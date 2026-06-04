const express = require("express");
const router = express.Router();

const classeController = require("../controllers/classe.controller");

const authMiddleware = require("../middlewares/auth.middleware");
const roleMiddleware = require("../middlewares/role.middleware");

// ADMIN ONLY
router.post("/", authMiddleware, roleMiddleware("admin"), classeController.create);
router.get("/", authMiddleware, classeController.getAll);
router.get("/:id", authMiddleware, classeController.getById);
router.put("/:id", authMiddleware, roleMiddleware("admin"), classeController.update);
router.delete("/:id", authMiddleware, roleMiddleware("admin"), classeController.remove);

module.exports = router;