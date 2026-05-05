Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7F021ABD7;
	Tue,  5 May 2026 20:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011862; cv=none; b=MTTG/XexR4WoIjyQmAp4bAzoN6vBMy3hvoPelHI+27cHGhm1kO9BR/9MSKPWnBLSIRLLDGKSN0gG3/2OSUehqVUBUSogRGR+Ld7P3JzyJukvHYwAlOUXw6LZvCcJAbS2tRcGTeVejxuGxqOXHcU/5Rjk4+9V/6Ea2wKeHXE8h90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011862; c=relaxed/simple;
	bh=gOs0o/TFscQxi9grZd1anD57wA4XSsfTcgDVQxqV7Ss=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=GgTjsbLBc6IHglJmFTeqPn/rjHn02JLGBWV/u2otiMIaImtgmUCbC/uXrZKnV37VgTZgCBuxK+LLf/bzQqSY5VhPIQ/T9ZwbA4cZ7LWD6VXACCWAk1YDPCdIccSIJzFanBR1LznGRIUHCtiHm6vd4med1HAgXych42WoKxsEOnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swmayGhQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swmayGhQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB47C2BCB4;
	Tue,  5 May 2026 20:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778011861;
	bh=gOs0o/TFscQxi9grZd1anD57wA4XSsfTcgDVQxqV7Ss=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=swmayGhQHSW6VEqPPE5oVPeWKIeC86o7p6C9cV2r+vHGDeIs4U/Hk0Jknnqp4+ER0
	 xiBTtrl4lY1TV6q3/GFUr/cI9tZaFmz572hac3FFKJErCPMuePcTu9ZH5jVRNjOR/z
	 zwumGJn9cnob7x9gC8A7P0HbpW8hLQnF4bp2/eKSS7zbAbjUjdrdyzu/AuIzeWb2G3
	 RTe4H40vk9wwQWrTtoRl0fuJfqOH8uzq2uvBjPyBOJC9yGbk05fcVoarurytfd8MAj
	 lKZPPRdMugQ6ZLxA5cvseyW1ppajkauczS9v4hUTFji4DlIM74zjBcp7+/bojj1b4F
	 1iBZMPtQMnbzw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 22:10:54 +0200
Message-Id: <DIB0LLUFPZQN.1SM466VKCHKWX@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/3] rust: alloc: add Box::zeroed()
Cc: "Alice Ryhl" <aliceryhl@google.com>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <acourbot@nvidia.com>, <david.m.ertman@intel.com>,
 <ira.weiny@intel.com>, <leon@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
References: <20260505152400.3905096-1-dakr@kernel.org>
 <20260505152400.3905096-2-dakr@kernel.org> <afoRXrwKjZAJuMaQ@google.com>
 <DIB0GYCMV121.2VPS75GHH082B@kernel.org>
 <DIB0IGF35JE8.2EQQRLEKVWSBW@garyguo.net>
In-Reply-To: <DIB0IGF35JE8.2EQQRLEKVWSBW@garyguo.net>

On Tue May 5, 2026 at 10:06 PM CEST, Gary Guo wrote:
> On Tue May 5, 2026 at 9:04 PM BST, Danilo Krummrich wrote:
>> On Tue May 5, 2026 at 5:48 PM CEST, Alice Ryhl wrote:
>>> I suspect some of these imports can be removed when you add the prelude=
.
>>
>> Yes, but I want to convert the imports separately, so keeping the change
>> minimal.
>
> So far we've been asking people to convert import styles whenever imports=
 are
> being touched. What's the reason for doing that in this specific case?

I will take this through the driver-core tree as a dependency; the import u=
pdate
for the alloc module will go through the alloc tree. A minimal change avoid=
s
unnecessary conflicts.
