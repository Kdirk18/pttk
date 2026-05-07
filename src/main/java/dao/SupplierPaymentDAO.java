package dao;

import model.SupplierPayment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

public class SupplierPaymentDAO extends DBContext {

    public boolean insertPayment(SupplierPayment payment) {
        String sql = "INSERT INTO tblSupplierPayment(import_invoice_id, supplier_id, payment_date, amount, payment_method, payment_status, note) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, payment.getImportInvoiceId());
            ps.setInt(2, payment.getSupplierId());
            ps.setTimestamp(3, new Timestamp(payment.getPaymentDate().getTime()));
            ps.setDouble(4, payment.getAmount());
            ps.setString(5, payment.getPaymentMethod());
            ps.setString(6, payment.getPaymentStatus());
            ps.setString(7, payment.getNote());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}