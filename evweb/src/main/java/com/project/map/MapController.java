package com.project.map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MapController {
	MapService service;
	MapAPIPull mapAPIPull;
	
	@Autowired
	public MapController(MapService service, MapAPIPull mapAPIPull) {
		super();
		this.service = service;
		this.mapAPIPull = mapAPIPull;
	}
	
	
	
}
