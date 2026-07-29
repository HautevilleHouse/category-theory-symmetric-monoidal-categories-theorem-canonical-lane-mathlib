import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure YonedaLemmaPackage where
  category : Type u
  homFunctor : category → (category ⥤ Type u)
  yonedaEmbedding : Prop
  fullyFaithful : Prop
  naturality : Prop
  yonedaLemma : Prop

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  fullyFaithfulClosed : Y.fullyFaithful
  naturalityClosed : Y.naturality
  yonedaLemmaClosed : Y.yonedaLemma

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.yonedaEmbedding ∧ Y.fullyFaithful ∧ Y.naturality ∧ Y.yonedaLemma

theorem yoneda_lemma_closed_from_evidence
    (Y : YonedaLemmaPackage) (E : YonedaLemmaEvidence Y) :
    YonedaLemmaClosed Y := by
  exact And.intro E.yonedaEmbeddingClosed
    (And.intro E.fullyFaithfulClosed
      (And.intro E.naturalityClosed E.yonedaLemmaClosed))

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse