const express = require("express");
const faker = require("faker");

const app = express();
app.use(express.json());

app.get("/generate", (req, res) => {
  const { fields, amount } = req.query;
  
  if (!fields || !amount) {
    return res.status(400).json({ error: "Missing 'fields' or 'amount' parameter" });
  }

  const fieldList = fields.split(",");
  const recordCount = parseInt(amount, 10);

  const data = Array.from({ length: recordCount }, () => {
    let record = {};
    fieldList.forEach((field) => {
      switch (field.trim().toLowerCase()) {
        case "firstname":
          record.firstName = faker.name.firstName();
          break;
        case "lastname":
          record.lastName = faker.name.lastName();
          break;
        case "email":
          record.email = faker.internet.email();
          break;
        case "phone":
          record.phone = faker.phone.phoneNumber();
          break;
        default:
          record[field] = `Unsupported field: ${field}`;
      }
    });
    return record;
  });

  res.json(data);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
