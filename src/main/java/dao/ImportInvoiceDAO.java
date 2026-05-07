package dao;

import model.ImportInvoice;
import model.ImportInvoiceItem;

import java.sql.*;

public class ImportInvoiceDAO extends DBContext {

    public int insertInvoice(ImportInvoice invoice) {
        String sql = "INSERT INTO tblImportInvoice(supplier_id, invoice_number, invoice_date, total_amount, payment_status, note) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, invoice.getSupplierId());
            ps.setString(2, invoice.getInvoiceNumber());
            ps.setTimestamp(3, new Timestamp(invoice.getInvoiceDate().getTime()));
            ps.setDouble(4, invoice.getTotalAmount());
            ps.setString(5, invoice.getPaymentStatus());
            ps.setString(6, invoice.getNote());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean insertInvoiceItem(ImportInvoiceItem item) {
        String sql = "INSERT INTO tblImportInvoiceItem(import_invoice_id, part_id, quantity, unit_price, line_amount) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, item.getImportInvoiceId());
            ps.setInt(2, item.getPartId());
            ps.setInt(3, item.getQuantity());
            ps.setDouble(4, item.getUnitPrice());
            ps.setDouble(5, item.getLineAmount());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updatePaymentStatus(int importInvoiceId, String status) {
        String sql = "UPDATE tblImportInvoice SET payment_status = ? WHERE import_invoice_id = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, importInvoiceId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}