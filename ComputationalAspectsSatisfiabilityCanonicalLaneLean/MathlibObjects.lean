import HautevilleHouse.ComputationalAspectsSatisfiabilityCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Data.Set.Basic
import Mathlib.Data.List.Basic

namespace HautevilleHouse
namespace ComputationalAspectsSatisfiabilityCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

abbrev BitString := List Bool
abbrev Language := Set BitString

structure DecisionProcedure where
  accepts : BitString -> Bool

structure WitnessRelation where
  accepts : BitString -> BitString -> Prop

structure PolynomialCertificateBound where
  degree : Nat

structure SatInstance where
  language : Language
  witnessRelation : WitnessRelation
  bound : PolynomialCertificateBound
  projectedLanguage : Language
  solver : DecisionProcedure

structure SatEndgameState where
  satInstance : SatInstance

def Decides (M : DecisionProcedure) (L : Language) : Prop :=
  forall x : BitString, M.accepts x = true ↔ x ∈ L

end ComputationalAspectsSatisfiabilityCanonicalLaneLean
end HautevilleHouse