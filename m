Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570C63BD224;
	Wed, 30 Sep 2026 19:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798396; cv=none; b=SXLrIbvfjEd4MvxcZMe1UUqhsoB8/pzN5HN90JR9dBRzuj43Vfld/PSZP0kwEmyd/ImM8FmDiyvxoxJFOGKSi+f0X4zLibHbyQDok/Bu3Ao5LKjw6Q2sLB//0N+XC1Uq83pW+FC0q//bpYdbo2FyvvxvRjKyU5axZwC1XAhJlb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798396; c=relaxed/simple;
	bh=WTG/eFb9l/qaauK8jXWspYDQ4kIRpWoF7OF37fMUz30=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=s0XtDMa0YXBt6ngktZ5QPXoRuFSaerm+DkMxGweiG4UwSxPLQxUbpIeTf5BhCqaYziMy3U3Hyz9DrAOf3n05lxmEaqG2V7a4N1I93csPyqkRP6jeIgsZCDZAsKn/Fwcg2oc9FUWmJ1dfIZpnvM2XxSk/b6uHFl3Iu9AaH9tlCY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyodJ6qB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyodJ6qB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EF21F000FF;
	Wed, 30 Sep 2026 19:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790798395;
	bh=WTG/eFb9l/qaauK8jXWspYDQ4kIRpWoF7OF37fMUz30=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=MyodJ6qBC7lba4QsHY0/VMgigDIl0Hik3W5dbbu8EJ6eJHpzd63U/J4ssiv7VCKMW
	 v2xyoCZ+wjB+fhuGA6TkLQAJJcxKej/mfJiUAGw/6xGjz23stEieFgocmFeFyhGeW0
	 PH3s7S1f+hIiKFtVk6px4jqpfEgZMaf4KS7W8DoJ0W4NN3Q6NZRIdsnypIZOjrk/fR
	 656ClPtYMItRXRYfBvRi5MyDmssTTh3bfrP0Rdfud3O4ScWwdEVpxdb+TR2X6RpVCL
	 tTJR/6iBQ1cU3xu+8lcs8bCWDFmLTEX+50qq5i2Gbk90+Mu1RJKu8bW/KybinX8pKd
	 dZhiantwzqTPw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 21:59:49 +0200
Message-Id: <DLSX1QUUMSA4.C3YJIVTOC2P7@kernel.org>
Cc: <aliceryhl@google.com>, <daniel.almeida@collabora.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <tamird@kernel.org>, <acourbot@nvidia.com>,
 <work@onurozkan.dev>, <me@kloenk.dev>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <ardalan@uci.edu>, <zhiyunq@cs.ucr.edu>,
 <dzueck@uci.edu>
To: "Priya Bala Govindasamy" <pgovind2@uci.edu>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/1] rust: io: Fix `Region::drop` releasing nested
 resources from the wrong parent
References: <cover.1788901318.git.pgovind2@uci.edu>
 <a71c5593cfc66e21f24d9c07ae3469fc4f8ea501.1788901318.git.pgovind2@uci.edu>
In-Reply-To: <a71c5593cfc66e21f24d9c07ae3469fc4f8ea501.1788901318.git.pgovind2@uci.edu>

On Tue Sep 29, 2026 at 7:46 PM CEST, Priya Bala Govindasamy wrote:
> Fix this by storing a reference to the parent resource in `Region`.
> This ensures that the parent remains valid for the lifetime of the
> child region.

I Sashiko has a valid concern:

https://sashiko.dev/#/patchset/20260929174612.Jss-fw-sa4kdEy7Hk2_uC8PLsUpZ-=
K_gGWyuz4Qc6_k%40z
