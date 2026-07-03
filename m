Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99F134A3D6;
	Fri,  3 Jul 2026 21:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113779; cv=none; b=JCj/RVa3e1S0rsnXcO+qVQkpP6ZAB+O35dEdpZvlDASduYr2eMi9mtH6QsbTruKZ6xU/spJW8sZT4/uoJS+5jq0L4ChJW5gcXpNvkCMIVqlLORQqWocXH7B0IXc1h8xwGshp7xVRpT/pUgY/IRWzHpNtxgcDx1bt6DP1eXllY90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113779; c=relaxed/simple;
	bh=TtxS13l1jqlI467pC9ruzMCu1mBAt9yaH0D8TKvk/nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SijnnuCFrONsJRD7prJEJ8OYSqWXDKsUXhNHai56xhjbne5qFO0FAhIHtlzoIqiZjYFimjaQdmFBzKe6FfS/qdkGeg+uxJFpcGcSNW8zxNIQllFq5q5yo9/qL+5yro8T8QV4Xz7pMyAFinmGEd+F+K8jxLx4HENZLkaqVK+8Rzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lo0DABun; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lo0DABun"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2395B1F000E9;
	Fri,  3 Jul 2026 21:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783113778;
	bh=pX5BLnfi8dquqiSNU5yAegbw+NiCfmBDTKRTp//OV8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lo0DABunnmOHn3h2S0/c7CcdyqyOgLigqjaIlTVRKmucwIjOKcCA/v/WnyMsYWAMg
	 MGZJxtAaeeY51B9XJ8du5PWKWcoXWirLE14Q7buQoJwyvc1tBXCoUE86sRdkdJDzcz
	 YJIAPsGHZ/l+AZ4XgiHEI4CSvFfaQQMmM249lRC3oVUynB/bwoU9IdNVTn6Ap8h60q
	 B8kT/R5xUHTgAegXuXmXDCWiQRjLrTg3OZyZbwJiGjfN6A80px5u6l2MHrrBs2x30x
	 7UhClF2wuE+KkFyDLXpXBUeuez5kvJjzHB16RTo4qtdlajoY48XZJ95BWnZJH1aQmD
	 mLot4t0AADdPQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: io: fix example in `register!` macro
Date: Fri,  3 Jul 2026 23:22:53 +0200
Message-ID: <20260703212253.1158511-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701160357.29031-1-linkmauve@linkmauve.fr>
References: <20260701160357.29031-1-linkmauve@linkmauve.fr>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed,  1 Jul 2026 18:03:54 +0200, Link Mauve wrote:
> [PATCH] rust: io: fix example in `register!` macro

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] rust: io: fix example in `register!` macro
      commit: 5dcef303b29f

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
