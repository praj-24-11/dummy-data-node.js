const express = require("express");
const csurf = require("csurf");
const faker = require("faker");

const app = express();

// Set up CSRF protection middleware
const csrfProtection = csurf({ cookie: true });

// Body parser middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Add CSRF token to each request for GET requests
app.get("/generate", csrfProtection, (req, res) => {
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

// Set up a route for the CSRF token (used in form or request headers)
app.get("/csrf-token", (req, res) => {
  res.json({ csrfToken: req.csrfToken() });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
