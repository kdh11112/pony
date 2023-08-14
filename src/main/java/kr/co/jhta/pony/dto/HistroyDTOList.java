package kr.co.jhta.pony.dto;

import java.util.List;

import lombok.Data;


@Data
public class HistroyDTOList {
	private List<HistroyDTO> techList;
	private List<HistroyDTO> partList;
}
