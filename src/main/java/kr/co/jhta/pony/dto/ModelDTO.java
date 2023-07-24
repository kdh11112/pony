package kr.co.jhta.pony.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ModelDTO {
	private int modelNo;
	private String modelName;
	private int modelPrice;
	private String modelEngineType;
	private String modelSuperCharged;
	private int modelDisplacement;
	private String modelFuel;
	private int modelMaximumOutput;
	private int modelMaximumTalk;
	private String modelFuelEfficiency;
	private String modelCoEmissions;
	private int modelFullLength;
	private int modelFullWidth;
	private int modelFullHeight;
	private int modelWheelBase;
	private String modelFrontTread;
	private String modelRearTread;
	private String modelUnladenVehicleWeight;
	private String modelFrontTire;
	private String modelRearTire;
	private String modelDriveType;
	private String modelTransmission;
	private String modelFrontSuspension;
	private String modelRearSuspension;
	private String modelFrontBrake;
	private String modelRearBrake;
	private String modelStreering;
	
}
