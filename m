Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B824423EB0;
	Mon,  3 Aug 2026 17:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779798; cv=none; b=b1a6Xy0KQC72As1fjik4JYo8Y8TwM4vpFbUf1jntKLJ1E1LFxhLCVCDIxNdJcUkQiXicO+pV/sYSmosKi8mHJdvTbalbMhWdetBBcbhesdhQ8zIB9yrXhUlfCXN/BUU8AVjSHXeeru9aQhmProaEMtSjODJe8J05fTTxK7XZDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779798; c=relaxed/simple;
	bh=DKKMZdM8BAxRbbPQIl2G5CnAYcAwr2Zr6rnCZL7k+KY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=kbjTSaK7hbHsW3HX3UuAU/TW9UC/wCZhgQCsVmS6HVlbT6H5pGZNGG91JLjyf5BkeJqdlK/AHs32nLVb7nxoFk32btvlY88PkzG9KuR/g/7S/gikUIqpJW4+Z8/GTaDMCv/4T/Y2vMwQAIvcNKiBYywGmMMW+4r1r66o1tmi36c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdRw8WJC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdRw8WJC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C6B1F000E9;
	Mon,  3 Aug 2026 17:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785779797;
	bh=ihzE00+caEyyGAyJnAUTpAAPcz2FPtHVqqcNm5l8H8Y=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=OdRw8WJCR5s67MPCCDorPFOUgUk/FS8WgAxajB4Ins7fYQvAzwi/g50xFhbRPDGI7
	 j5o2T8zpPNIh0Q4ECnR5oTU9NkMEeV5ssoY1AN63S9jYy4A1MiefEuboQLdSH6LjaD
	 E0ZbFipEqW3LKKkUY8HldcUeS+8jsOKkFcpYfOCucMi8x9pPGuAQoPFWPP7TzhfsG6
	 ZgcOQq5Y+PdPZNlGeq3RVNgeLlFqMHK42hWY3YjxsLfxnd3/eordh3BFB56ko5SEzB
	 2j21QfTqKnSHC6kpRMRbw/cjw400Wp2PPlR2yfOeiZ3JC2sVD6W8L4InN48k6cM8zc
	 5O6oB4VDxgyMg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 19:56:30 +0200
Message-Id: <DKFI3QBK1A04.28I347HOKJ8TE@kernel.org>
Subject: Re: [PATCH v2 8/9] drm/tyr: add gpuvas debugfs file
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Jan
 Kara" <jack@suse.cz>, "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, "Melissa Wen"
 <mwen@igalia.com>, "Wambui Karuga" <wambui.karugax@gmail.com>, "Eric
 Anholt" <eric@anholt.net>, "Ben Gamari" <bgamari@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Alvin Sun" <alvin.sun@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
 <20260731-tyr-debugfs-v2-v2-8-aea19eccb996@linux.dev>
In-Reply-To: <20260731-tyr-debugfs-v2-v2-8-aea19eccb996@linux.dev>

On Thu Jul 30, 2026 at 7:05 PM CEST, Alvin Sun wrote:
> +impl drm::debugfs::DrmSeqShow<TyrDrmDriver> for GpuvasShow {
> +    fn show(guard: &drm::RegistrationGuard<'_, TyrDrmDriver>, m: &seq_fi=
le::SeqFile) -> Result {
> +        guard.registration_data_with(|reg_data| {
> +            reg_data
> +                .debugfs_data
> +                .gpuvas
> +                .for_each(|vm| vm.dump_gpuva_info(m))
> +        })
> +    }
> +}

Should simplify to:

	impl SeqShow<TyrDrmRegistrationData<'_>> for GpuvasShow {
	    fn show(reg_data: &TyrDrmRegistrationData<'_>, m: &SeqFile) -> Result =
{
	        reg_data
	            .debugfs_data
	            .gpuvas
	            .for_each(|vm| vm.dump_gpuva_info(m))
	    }
	}

> +    fn debugfs_init<'a>(dev: &'a drm::Device<Self, drm::Normal>, dir: &S=
copedDir<'a, 'static>) {
> +        dir.seq_file::<GpuvasShow, _>(c"gpuvas", dev);
> +    }

Should become:

	fn debugfs_init(dir: &debugfs::ScopeRef<'_, TyrDrmRegistrationData<'_>>) {
	    dir.seq_file::<GpuvasShow>(c"gpuvas");
	}
