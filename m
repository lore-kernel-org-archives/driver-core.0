Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A784EDCAD
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 12:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412358; cv=none; b=HBWPOQv5VTTnxC/92rhWHnibFtBOb06BP8lw2twxLOaoZtaYwRmIAkz08DUdTPF0QZxCOj8w4bFC+8wehSuaCTfIJIdhxVD4AtogZuFrGFx5BBs4fGvmJUkfpJklERbuNjgn5fzec2w6e31ux52TD9VH06pmWzCF6z9GWLDn4tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412358; c=relaxed/simple;
	bh=1fsh4TpkJEGlEhvht3UddIEVTuU0bNGX+p6qreMvSv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4uct1NAW7vbtZYUUy+aDaEMTkSizt++8nZPpPp5xOHWT9BnALJGa7qDfxtR5OXLCdV74NonxFjBwr7dH3GgV5X/yOJCDv8Fzvz0nFInNxbIyrmfbIoIavi5IngDfBvlFbIDRiD+srRDrRxC+W6Jma6HeiLkkCRXKOdBXVLuePk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vlqhqKf5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vlqhqKf5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97C181682;
	Mon, 19 Oct 2026 05:19:12 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6E553F673;
	Mon, 19 Oct 2026 05:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792412355; bh=1fsh4TpkJEGlEhvht3UddIEVTuU0bNGX+p6qreMvSv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vlqhqKf5M0g4+9Gbo+GEqbLta+7Rzl9bRMuBJxBYDkRZ4dtN0Ft1MMCQN5Qow6BAa
	 I94/ZjeITqG3/3pkXdMd7faMAeQLxfxT4CzXwB097UvohvE5qz26Iirw5jQN7IQWQM
	 CO9o29i1iqFHRTAV/BOJ0jj+WFp9iZfYcvDqBnRk=
Date: Mon, 19 Oct 2026 14:19:08 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, daniel.almeida@collabora.com,
	boris.brezillon@collabora.com, work@onurozkan.dev,
	samitolvanen@google.com, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 2/3] rust: platform: wire runtime PM callbacks
Message-ID: <atYKvHQm9qJ9wY-e@arm.com>
References: <20261005133857.1572243-1-beata.michalska@arm.com>
 <20261005133857.1572243-3-beata.michalska@arm.com>
 <20261016121230.3724323-2-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016121230.3724323-2-aliceryhl@google.com>

On Fri, Oct 16, 2026 at 12:12:30PM +0000, Alice Ryhl wrote:
> On Mon, Oct 05, 2026 at 03:37:40PM +0200, Beata Michalska wrote:
> > @@ -223,6 +225,14 @@ pub trait Driver {
> >      /// The table of ACPI device ids supported by the driver.
> >      const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
> >  
> > +    /// Provides driver's PM callbacks, if any.
> > +    fn dev_pm_ops() -> Option<crate::pm::DevPMOpsRef<'static, Adapter<Self>>>
> > +    where
> > +        Self: Sized,
> > +    {
> > +        None
> > +    }
> 
> Since `DevPMOps::pm_ops()` is a `const fn`, can this be an associated constant
> `const DEV_PM_OPS: Option<crate::pm::DevPMOpsRef<'static, Adapter<Self>>> = None;`
> to match `OF_ID_TABLE` and `ACPI_ID_TABLE` right above it?
>
It can, as long as no one would mind making the Driver trait sized.

---
BR
Beata
> Alice
