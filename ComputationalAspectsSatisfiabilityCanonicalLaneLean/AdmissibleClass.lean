import HautevilleHouse.ComputationalAspectsSatisfiabilityCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ComputationalAspectsSatisfiabilityCanonicalLaneLean

structure AdmissibleClass where
  lane : SatInstance
  solverDecidesProjectedLanguage : Decides lane.solver lane.projectedLanguage
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  Decides A.lane.solver A.lane.projectedLanguage ∧
  (A.endpointSatisfied ∨ A.remainderRecorded)

end ComputationalAspectsSatisfiabilityCanonicalLaneLean
end HautevilleHouse