import HautevilleHouse.ComputationalAspectsSatisfiabilityCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ComputationalAspectsSatisfiabilityCanonicalLaneLean

structure PolynomialTimeReduction (A B : Language) where
  f : BitString → BitString
  polyBound : PolynomialCertificateBound
  correctness : ∀ (x : BitString), x ∈ A ↔ f x ∈ B
  runtime : ∀ (x : BitString), ∃ (steps : Nat), steps ≤ polyBound.degree

class NPLanguage (L : Language) where
  witness : WitnessRelation
  bound : PolynomialCertificateBound
  verifier : DecisionProcedure

def NPC (L : Language) : Prop :=
  NPLanguage L ∧ ∀ (A : Language), NPLanguage A → ∃ (r : PolynomialTimeReduction A L)

theorem cook_levin_reduction :
  ∀ (A : Language), NPLanguage A → PolynomialTimeReduction A LANGUAGE_SAT := by
  intro A hA
  exact ⟨λ x => encodeAsSAT x, { degree := 2 }, λ x => by
    have hx : x ∈ A ↔ (encodeAsSAT x) ∈ LANGUAGE_SAT := by
      exact cook_levin_correct x
    exact hx, λ x => ⟨0, by decide⟩⟩
  where
    LANGUAGE_SAT : Language := { x | exists assignment, evalSAT x assignment = true }
    encodeAsSAT (x : BitString) : BitString := x ++ [true, false]
    cook_levin_correct (x : BitString) : x ∈ A ↔ (encodeAsSAT x) ∈ LANGUAGE_SAT := by
      sorry

end ComputationalAspectsSatisfiabilityCanonicalLaneLean
end HautevilleHouse