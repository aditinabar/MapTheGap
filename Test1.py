# -*- coding: utf-8 -*-
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import NoAlertPresentException
import unittest, time, re

class Test1(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        self.driver.implicitly_wait(30)
        self.base_url = "http://ritter.tea.state.tx.us/perfreport/src/"
        self.verificationErrors = []
        self.accept_next_alert = True

    #added argument 'schoolname' to some of the lines.
    def test_1(self, schoolname):
        driver = self.driver
        driver.get(self.base_url + "/perfreport/src/")
        driver.find_element_by_xpath("//p[4]/a/strong").click()
        driver.find_element_by_id("input").clear()
        driver.find_element_by_id("input").send_keys(schoolname)
        driver.find_element_by_id("cont").click()
        Select(driver.find_element_by_id("clist")).select_by_visible_text("LAMAR H S in HOUSTON ISD, HARRIS County")
        driver.find_element_by_css_selector("option[value=\"101912008\"]").click()
        driver.find_element_by_css_selector("input[type=\"submit\"]").click()
    
    def is_element_present(self, how, what):
        try: self.driver.find_element(by=how, value=what)
        except NoSuchElementException, e: return False
        return True
    
    def is_alert_present(self):
        try: self.driver.switch_to_alert()
        except NoAlertPresentException, e: return False
        return True
    
    def close_alert_and_get_its_text(self):
        try:
            alert = self.driver.switch_to_alert()
            alert_text = alert.text
            if self.accept_next_alert:
                alert.accept()
            else:
                alert.dismiss()
            return alert_text
        finally: self.accept_next_alert = True
    
    def tearDown(self):
        self.driver.quit()
        self.assertEqual([], self.verificationErrors)

if __name__ == "__main__":
    unittest.main()
