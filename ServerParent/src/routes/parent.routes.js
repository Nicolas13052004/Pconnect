const express = require("express");
const router = express.Router();

const parentController = require("../controllers/parent.controller");

const authMiddleware = require("../middlewares/auth.middleware");
const roleMiddleware = require("../middlewares/role.middleware");

// ADMIN ONLY → créer parent
router.post("/", authMiddleware, roleMiddleware("admin"), parentController.create);

// voir parents
router.get("/", authMiddleware, parentController.getAll);
router.get("/:id", authMiddleware, parentController.getById);

// admin update/delete
router.put("/:id", authMiddleware, roleMiddleware("admin"), parentController.update);
router.delete("/:id", authMiddleware, roleMiddleware("admin"), parentController.remove);

module.exports = router;