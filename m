Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EA9332906
	for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 18:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782327568; cv=none; b=eJXm/gT4mp7fDWufaJQB/r+RrHjPVn7+5P6CAr7QKPVMdKFjpxH7CyH8fZcvhem5RtKMjHxrC1fiET6otBX5J0zPqqfszJHk0zNjprpCSNLwmN/ESteMZCbNibeRvI4VURhyPrPx/4bUNE2VHLH00al8NHIs1Kyj2YNzpzJbiDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782327568; c=relaxed/simple;
	bh=zIstxXEsUAI+ajGpmVV2P35LQJBkQnh0RLzi3QQJ3UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFECioxzsZT8H0RPl6AznBZ62z/Wgafyo3CB7B3MW0w0aILJiXB+KN6lThZb6yOUEAoYPqxKISa6vMwRtjDPoHlmEiIOyyVPqjNXwIR2Z/MY3PJNygrJtgB3toCYEYGrZsXDPcfm1wj38/wvTBA9B1FvYaef3P5a+NiVSqUrIk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=c4RNTpSY; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="c4RNTpSY"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8dd6e530061so19562946d6.2
        for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 11:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782327566; x=1782932366; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pT11NgXcnMUuSA5mrycomy1NHWdVYPAjx4vn9wcSoDQ=;
        b=c4RNTpSYfKToP3wrggyhnbRyJVWiXEcxg+UcorSwxGzMVXZfd0CKXZcRZ0fIc+2+hR
         T+FJ9T9Hc+rTg8Om4DPGE05OUPpAtI9PUE/CRs8nGQw9oV8mntUnzMlgC+JKoLK8786X
         aBpaudBXNwB3Swde4W8HpIyQjcZbxKjSKV32rLESe4HNp0ualM0EqzEb0jb0WHTDIOKi
         gMxeHkCoUIIniPaqEbJmWciR3mzJWMetSMo/CiRG6SdG8fMb16R2H/xKog7yV76SPSsC
         Yky9ZWD2E6cHdyntoVtdtkXYTxGpVqzqvdZPtbWZp0lFH8P7Gsn2mvOeiULif5hRuPiZ
         iqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782327566; x=1782932366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT11NgXcnMUuSA5mrycomy1NHWdVYPAjx4vn9wcSoDQ=;
        b=s2J4gdKbskKrZJlL6PxVL/OYgWhWtsOSjnSe6tQk75z8Xo9VGlT7UM/LYquyPTO8Tx
         4JsiMM2yCXIk97282otcsq9O6fjAr/Rb07ixNb8MYEaqOphGWzi3i1JRS1Vg41p38f1F
         +q+dh2Pe8o12DDrstHtvS0orwN3fxDU5VLTqFHx8XlOF0CBZclRYHSqUMMhfff4u5KDU
         VmO4cF1hqo07uw3jpzvJhsXX7oDFYP2ad+v941bw9gHeOScgfpWOiEkKaK9IcBgam+L4
         YAkntEIeqCd03UlHZ/YV77ITVSSZjDsHP7fP/HhzGJ9/EYVifTigYFFoEBZqAW7z0g60
         OOMw==
X-Forwarded-Encrypted: i=1; AFNElJ+OE5uAcfNC9PW94LbBUwqUJyCNuYjmrt/m7awhCobIzhSUrgkQIDhq6ni7frHNox9vetiGoLq6PZsUKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDaDQnRd2NwNxN/oq4UdrlInvBCrWSCzyl65E0yjkow8woHzzD
	n/QsqRMduE6GEBWnMnYCfrGKW54blx9tVFKTlfzvq9mPm27TTV+SGLEiIbCXWm8Gn6o=
X-Gm-Gg: AfdE7cl2JL3qpGAyBvrH+bS+sTJO+YxSxqtVHBjA86vWAZoxmHbiNNTK5kzKHO547a2
	YZHHDwOCkzRpSEZ9OCs8Q2XjpHZUXlB/1GHQzo7X7mi65lT0OMcZoKYggX9TM9LTIMMiBg3n5s0
	JKsmRvGmiwuF4qC55LImx2OK0yPevbGlsHcuX6zZ+o2Z98LNhzmmqFkIpEgkMnybRq1foZ9mpV5
	YBJIZPVggBgcwaRCnjN3GHmi/Wu1t4tklyX/vXi8Scwa0P0kiTXgA04x5GBEcWyIlVoakG+Wlsm
	6EYAW0rm9NVfInnQ1l8XnHLNHKZA2wrnGnTzV8ijItIu74rES2ob1Uj+/xk4ghWNP8NYakHM4FS
	jaSC3TjO2/PXlJYDpD/ZWFQIee2Wcqc3eGxXPHuioDNhXDbMQK2PJloaVIaRHKJlHJvFdf5B+YT
	hPwC2Y240iU5nLFFd+o5Lh5k9wEGJyCSL/Opr2cbMDiXQbrExIhHB9qUe57cFC64ttxKR6
X-Received: by 2002:ac8:5ac3:0:b0:519:5836:2f04 with SMTP id d75a77b69052e-51a61af8223mr67843231cf.8.1782327565960;
        Wed, 24 Jun 2026 11:59:25 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018898sm161022456d6.7.2026.06.24.11.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 11:59:25 -0700 (PDT)
Date: Wed, 24 Jun 2026 14:59:20 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org, nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com, ira.weiny@intel.com,
	apopple@nvidia.com
Subject: Re: [PATCH v5 0/9] dax/kmem: atomic whole-device hotplug via sysfs
Message-ID: <ajwpCOSGapenRPsu@gourry-fedora-PF4VCD3F>
References: <20260624145744.3532049-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624145744.3532049-1-gourry@gourry.net>

On Wed, Jun 24, 2026 at 10:57:35AM -0400, Gregory Price wrote:
>... snip ...

Disregard, there are a few unaddressed Sashiko comments, I'm just going
to respin this.  Will wait until after the merge window closes for v6.

The rough shape of things should still hold w/ prior feedback.

~Gregory
