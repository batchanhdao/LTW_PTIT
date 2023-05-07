package QLKS;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("alteredRoom") 
public class HomeController {
	
	@Autowired 
	private RoomRepository roomRepo;

	@ModelAttribute("alteredRoom")
	public Room room() {
		return new Room();
	}
	
	@GetMapping("/") 
	public String home(Model model) {
		List<Room> rooms = (List<Room>) roomRepo.findAll();
		model.addAttribute("rooms", rooms);
		return "homepage";
	}


	@GetMapping("room/details/{id}") 
	public String manageRoomDetails(Model model, 
			@PathVariable("id") Long id) {
		Room room = roomRepo.findById(id).orElse(null);
		model.addAttribute("room", room);
		return "roomDetails"; 
	}

	@GetMapping("room/update/{id}") 
	public String changeRoomInfo(Model model, 
			@PathVariable("id") Long id,
			@SessionAttribute("alteredRoom") Room alteredroom){
		Room room = roomRepo.findById(id).orElse(null);
		if (room != null) { 
			alteredroom.setId(room.getId());
	        alteredroom.setName(room.getName());
	        alteredroom.setType(room.getType());
	        alteredroom.setPrice(room.getPrice());
	        alteredroom.setDescription(room.getDescription());
		}
		model.addAttribute("room", room);
		return "roomUpdate";
	}

	@PostMapping("room/update") 
	public String confirmChange(Room room, 
			@SessionAttribute("alteredRoom") Room alteredroom) {
		alteredroom.setName(room.getName());
		alteredroom.setPrice(room.getPrice());
		alteredroom.setType(room.getType());
		alteredroom.setDescription(room.getDescription());
		roomRepo.save(alteredroom);
		return "redirect:/"; 
	}
	
	@GetMapping("room/delete/{id}")
	public String deleteRoom(Model model,
			@PathVariable("id") Long id) {
		Room room = roomRepo.findById(id).orElse(null);
		model.addAttribute("room", room);
		return "roomDelete";
	}
	@PostMapping("room/delete/{id}")
	public String confirmDelete(@PathVariable("id") Long id) {
		roomRepo.deleteById(id);
		return "redirect:/";
	}

	@GetMapping("room/add") 
	public String addRoom(Model model) {
		model.addAttribute("room", new Room());
		return "roomAdd";
	}
	
	@PostMapping("room/add")
	public String saveRoom(Room room) { 
		roomRepo.save(room);
		return "redirect:/";
	}
}
