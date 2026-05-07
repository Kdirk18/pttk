package dao;

import model.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAO extends DBContext {

    public List<Service> findByKeyword(String keyword) {
        List<Service> list = new ArrayList<>();
        String sql = "SELECT * FROM tblService WHERE service_name LIKE ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Service s = new Service(
                        rs.getInt("service_id"),
                        rs.getString("service_name"),
                        rs.getString("description"),
                        rs.getInt("estimated_duration"),
                        rs.getDouble("base_price"),
                        rs.getString("service_status")
                );
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Service findById(int serviceId) {
        String sql = "SELECT * FROM tblService WHERE service_id = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, serviceId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Service(
                        rs.getInt("service_id"),
                        rs.getString("service_name"),
                        rs.getString("description"),
                        rs.getInt("estimated_duration"),
                        rs.getDouble("base_price"),
                        rs.getString("service_status")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}