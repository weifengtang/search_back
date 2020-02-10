package com.twf.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServletStartupListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent arg0) {

    }

    @Override
    public void contextInitialized(ServletContextEvent event) {
        String path = event.getServletContext().getContextPath();
        event.getServletContext().setAttribute("PATH", path);
    }

}
