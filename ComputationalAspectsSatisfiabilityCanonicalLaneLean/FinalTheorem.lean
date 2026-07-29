import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalAspectsSatisfiabilityCanonicalLaneLean

def ConstrainedSatClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_sat_endgame (A : AdmissibleClass) :
    ConstrainedSatClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ComputationalAspectsSatisfiabilityCanonicalLaneLean
end HautevilleHouse