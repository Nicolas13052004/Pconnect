const express = require("express");
const cors = require("cors");

const { sequelize } = require("./src/models");
const routes = require("./src/routes"); // 👈 IMPORTANT

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// ✅ AJOUT IMPORTANT ICI
app.use("/api", routes);

app.get("/", (req, res) => {
  res.json({
    message: "ParentConnect API running 🚀",
  });
});

async function startServer() {
  try {
    await sequelize.authenticate();
    console.log("✅ PostgreSQL connecté");

    app.listen(PORT, () => {
      console.log(`🚀 Server running on port ${PORT}`);
    });
  } catch (error) {
    console.error("❌ Erreur DB :", error);
  }
}

startServer();