Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840359;
	b=fSHushM44kc/8SWL4Yj33/G7jfjFtvocpTJpi46Qgc+SE55rNo27pUzBH5snqu8TMrlR
	 pU2rdHqSCWkGqOqCSeF0sgRl3QuHx+iNO7c9ekqpedsAKx199GWUZtfQn/mwV9+50Dyu7
	 JvDF0SSzZnJX0tksjYikX9VRy8A7IqgEf7Nx4RlNPQcMRAR15gDqPnyQZD4zLJI82JC2P
	 yKOzKtiEDyqnRMynNV+Co81IX8VIbO4cUByISTK/x8ls6pDW8A76FSYD6rBedj2mhGUJ+
	 FWlbamocOr87vBtKMfsd0dDzAnwyN6lzS8+jCJD658Oa30GfaVQlCpz3NRNFMaGrpSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
	b=ODpaer/WzTBUKc6QBDVNBflk4nKM1SbGEiCx9KjlwZ2bM5H4DcOMIhEYFZhzFQnnHScC
	 olnMj7+nRxRzk0ZGOCP55cuB1K4jrnlEUGlWj52Ea27Y/q+eUXfs9X6vL3Yus4/bqSBci
	 PqlI7VNI4HmBumG6JOrX44Rmw47C9AGN0QNTGAq2Yiz+wmNfN12CXbdnruM94oRQtoCCo
	 7gFaB2hYtpKDgBDjcob2vYuKkiQEMZQBTpnRnxxAm+7+FdBJjRhOMaIQOTiIfry9pRmSF
	 u/5BY/kuTAwVEwzB3hp5oECBvJEfkJVVFd/IwgOvunuS14E42qQhO2cHb/JeZb108lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YJ1u7+3q;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B7A606A339
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 14:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B7A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YJ1u7+3q
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9496400270fso215429685a.1
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 06:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794840358; x=1795445158; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
        b=YJ1u7+3q8ho8S8Cmf/2w5wU4CUF80KQfEx0dIwjylesVJSVp27D0TnXVhGDFGsq/W7
         Yb8X2Sx75plWxB0mHvomzU/+SwheHamPTUSF84/eyfqxAOUo3KqKfLj8B1X+rg3Y/Cbl
         iH5BJ9I9aimPuYADSaa9rXgic7xW4xi4ybOfyScVe2rMyrDy+439om+gewLAqXNGlGak
         DFvqrV19hfYi3qwYmFJRlFwTwrxoUQgLLPiPhKihWQ7vE2eO+F347DEcxXDMHyISNihk
         FcZWIs6r9YWAmKVOdSENQbUB1Vu1/Yg0vLkHCD72z3r+cCLouGtUv1fhIM7YUXYqxWdd
         q2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840358; x=1795445158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
        b=BvT44MYr6g4kQA/cJuD9A1kMdf9mX7oePzFInAmJpvviTnRlGbTOijPHkmlwuNwW9/
         L0b00Roh5Vc+YXjNRbtDfll5NuiQxij0MAhIgtfvvpv5F1965vxHyr/gvBzWO+Z0TGQg
         O2qN4TuySrhS0CS3y1VGGlu2u5Duk7k2BiNDLOEwVBcRQHZNAFVCfD8YuEwKzqIlKagJ
         meQymbeL9j6ETsyYxZuOuOZu9Om4m8Av7+5aCfu23K7XXjSQSFZJ+0ax89ZlUWLkDvDh
         psEP8uM8NYJ8BdnKeVhGdikHdnVwI7ZqWbCh5wO0BlPP2CjViRBVPhjnbseX0ARQv7dW
         qYog==
X-Forwarded-Encrypted: i=1; AL+hErG4WmhibGer8Z4L193x2z2T60eFeZbRUopB16srKGHm6V3QkCpqAwqAc0c7Cfq/QgzANtSNXc7fQ55fRQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/xb3k634ZVDhnKsFtb4PaXlDmHKMvKDP6phAG1U6oUh1hqXcgx
	bd5zTzmMJ6qdPPw9CFegiKyeEsWnwPczU2SzsYXwvSjFm8S5+O8jgYP2+jL6gxr0jFg=
X-Gm-Gg: AYBFou2sCUu5qwqqFgTyXQTBtVtUScg0mU2XZOvkIBTBftXJkzZuwnFf9HsSyC4XKCF
	Tm3ydzZwj17cqPziN4aAcsWUeqv/ROAs9pM8BDbXDkjOYE3ijsWdS7LRXSu5Y8N3sDA9Mp9dkCi
	KQ1poIjFrvMtU+PdR9moW81qheTBP+e4xvpUpbJFDiTonHHkSpfmZZFhbuL7NAQG0Vg/tE47pzE
	Eol4TU/zU/LkteWxzmHP3khVIWkg4CpaFNxQ2QzuzmYz3v6zSH7gxKiL+cMlPoVfJUPUHQRkXrY
	jSLewk1ER5p+UkPqSsVwCb1OrjwbXxY5wE8BaQJkJTy2w0obeYIIhmzAhVJZPoSLkgdPtdnsGrE
	fDghPxipY7ijbT9Fe0QkTA9gcpmtFScRM+gekS2IY5JtBilSvfoKpj+3emkT5TlozzrcBH5ZSPM
	ISC3Owi2J/XJbcok0bKIGdy+2d5oO7MBFarVqJc0Wpoi/99cWNJ2rZWMwr8nXTGfg0R683HbB+o
	9Q3mXR3WV8lxMpXw7+713ZJEkoY8PL6EDlok5Ocw5uoB+dmKYueNEsx1hh6EYPnUhp13HPUvctr
	3cOkvQ==
X-Received: by 2002:a05:620a:a41a:20b0:949:5872:be1b with SMTP id af79cd13be357-9495872d3c0mr1015844485a.39.1794840357475;
        Mon, 16 Nov 2026 06:45:57 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836079sm858473985a.18.2026.11.16.06.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:45:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSxxz-00000009V73-1sJy;
	Mon, 16 Nov 2026 10:45:55 -0400
Date: Mon, 16 Nov 2026 10:45:55 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Johan Hovold <johan@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261116144555.GM2532299@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <yq5amrr8yldi.fsf@kernel.org>
 <20261116132046.GI2532299@ziepe.ca>
 <20261116144103.GU11319@unreal>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116144103.GU11319@unreal>

On Mon, Nov 16, 2026 at 04:41:03PM +0200, Leon Romanovsky wrote:
> > I think it should only be for the duration of a bound driver?
> 
> For now, I decided to disallow state changes because the IOMMU may outlive the
> bound device. Unbinding does not fully reset the device, so we must quiesce it
> to ensure complete security.

When we refine the lifecycle for the iommu this issue should go away
too

Jason
