/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.ItemMenu;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

/**
 *
 * @author William
 */
public class RepositorioMenu {
    private SimpleJdbcCall obtenerItemsMenu;
    
    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.obtenerItemsMenu = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerItemsMenu").
                returningResultSet("itemsMenu", BeanPropertyRowMapper.newInstance(ItemMenu.class));
    }
    
   public List<ItemMenu> obtenerItemsMenu(int idUsuario) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdUsuario", idUsuario);
        Map resultado = obtenerItemsMenu.execute(parametros);
        ArrayList<ItemMenu> items = (ArrayList<ItemMenu>) resultado.get("itemsMenu");

        return items;
   }
}
