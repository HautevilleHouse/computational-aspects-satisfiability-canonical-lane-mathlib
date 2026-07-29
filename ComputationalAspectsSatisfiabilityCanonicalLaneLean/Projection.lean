import HautevilleHouse.ComputationalAspectsSatisfiabilityCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalAspectsSatisfiabilityCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def satProjection : Projection SatEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem sat_projection_idempotent (x : SatEndgameState) :
    satProjection.toFun (satProjection.toFun x) = satProjection.toFun x := by
  exact satProjection.idempotent x

end ComputationalAspectsSatisfiabilityCanonicalLaneLean
end HautevilleHouse