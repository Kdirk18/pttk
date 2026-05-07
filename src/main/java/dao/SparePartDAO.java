package dao;

import model.SparePart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SparePartDAO extends DBContext {

    public List<SparePart> findByKeyword(String keyword) {
        List<SparePart> list = new ArrayList<>();
        String sql = "SELECT * FROM tblSparePart WHERE part_name LIKE ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SparePart p = new SparePart(
                        rs.getInt("part_id"),
                        rs.getString("part_name"),
                        rs.getString("description"),
                        rs.getString("unit"),
                        rs.getDouble("sale_price"),
                        rs.getInt("stock_quantity"),
                        rs.getString("part_status")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public SparePart findById(int partId) {
        String sql = "SELECT * FROM tblSparePart WHERE part_id = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, partId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new SparePart(
                        rs.getInt("part_id"),
                        rs.getString("part_name"),
                        rs.getString("description"),
                        rs.getString("unit"),
                        rs.getDouble("sale_price"),
                        rs.getInt("stock_quantity"),
                        rs.getString("part_status")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean insertPart(SparePart part) {
    String sql = "INSERT INTO tblSparePart(part_name, description, unit, sale_price, stock_quantity, part_status) VALUES (?, ?, ?, ?, ?, ?)";

    try (Connection con = getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, part.getPartName());
        ps.setString(2, part.getDescription());
        ps.setString(3, part.getUnit());
        ps.setDouble(4, part.getSalePrice());
        ps.setInt(5, part.getStockQuantity());
        ps.setString(6, part.getPartStatus());

        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

public boolean updateStock(int partId, int quantity) {
    String sql = "UPDATE tblSparePart SET stock_quantity = stock_quantity + ? WHERE part_id = ?";

    try (Connection con = getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, quantity);
        ps.setInt(2, partId);

        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
}