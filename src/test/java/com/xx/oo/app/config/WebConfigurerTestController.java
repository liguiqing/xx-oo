package com.xx.oo.app.config;

import com.xx.oo.app.service.dto.UserDTO;
import com.xx.oo.eda.EventBus;
import io.swagger.v3.oas.annotations.parameters.RequestBody;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WebConfigurerTestController {

    @GetMapping("/api/test-cors")
    public void testCorsOnApiPath() {}

    @GetMapping("/test/test-cors")
    public void testCorsOnOtherPath() {}

    @GetMapping("/test/eda/publish")
    public void testEda(@RequestBody UserDTO user) {
        EventBus.publish(new UserCreated(user));
    }
}
