Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617407;
	b=lFhr9yLaEnGrO7J4jd0KbSLlRQXDRgGilEn4RzIfJpUn4dc72HW3UGKCRblCN//wbWzR
	 Z/mgscjXgPkmKWTj2cjNDZl/SGDrwHrrMV8jnM/7PAAuCnCaUkgwTbbD1mee2RROeyXYG
	 w3j89U1mI7/t8X88AUCP6kJ4T+0j7A87J6RBk7t37nHrvnSlwR0NTEz1pkjwtCvTvnNci
	 liFziUP2siZ1NpZ+XwClmvo46Nj+LwkWkbx9sSH8qez0UY6h51HqhjFLc5HiEPxTOoJf1
	 Tygx/1DjlNvgUvp+IfusmW7wRlt5T4a4R/nJEGYpxo/I7zRldmdsGDJVNLaB8hTUvzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jZ0ODJBUI26+BRK0bblrmNavhVVExfleUfyE4pxTCBs=;
	b=oP5YLAS5iwY8nfAduebP9cswJOxwyrQYhyMfKMK4dIxEJ1z5CAUdegE6Pc/F7zAEcVDy
	 CcsLmiGaFoG8OCtpIjZJb8SMzh4WkZGXjJntj5nqKEEQF4moUYF5NuTVUHGRXqRmYDJ5H
	 q9Osvy6D5OZvKCoXZDhPWySqAgVi7FrI7QnAunVobRaSwyrfhRaFsBTLGlzbkB3T5vKk4
	 EbeW7bJ/LCMlTeSzcGSq+KXf3cPDlWCOd33KTIyXsNXITp3yDvqqrH6XnhR3ve/TVs31U
	 X62YGw4K8mP2tdpnzM53x0EFIE0BcZNIvnsd60NvwL4OaUdPT7AG7oCJNTFFwGo/+gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nNufUi+b;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AAB606A327
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 14:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94AAB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nNufUi+b
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365f9a04c5so42717991cf.1
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 06:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795617405; x=1796222205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jZ0ODJBUI26+BRK0bblrmNavhVVExfleUfyE4pxTCBs=;
        b=nNufUi+b+idZrCGl8AZNlJJQ45+Bhfbsofh/RKlszlAZnTI0y6uIgecAwkabYJyyWb
         Uas9Ae4A1wiY80p8PJZ3C1s6fOQxUW5XcRs58VCysSvzjk9bgoJjk3aIJpkw0FBXOS4s
         rnbfI9LezAcxyjFFLRzxe/9Pkd0pG1JbiyC4deR6nK+NEZSTqnoAzcKEXJSFESYpoR3G
         XLJdE93E0lt8gDRWC2ZhGtGxGdv4KUCbDM5TKwNgJtVMHuIXr2k7EdWUVAkVyKljxqTI
         4UfXDl4OCQAyWvNe45HYCBW419byzZjag0eGFpFJbvvyHszt1xn5r75f0IqG/EoUeMKh
         SnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617405; x=1796222205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZ0ODJBUI26+BRK0bblrmNavhVVExfleUfyE4pxTCBs=;
        b=Zq437odVzdSg7+ZRtN3A8yqAy2o44X9AIamYJTAPFDbfYC3c54AWEgRMvBTOtSxW8B
         P/5EIC+prqPtdKOc0t8f/mNFnZ0PSf+z2ykUq4HLnKawAX9eavNV+Tgvvo4SwRReJ/Zg
         NwmroGsXoZyQYzcce+E5GIfgIVb7/2AaqG/HXoGEfJdHCnog7k4crPPhwSlFSgTZy3PT
         9VQYalJw9Jj1UyjAEU/bFxZGLyzXQSkbLvKNZ108/svOEC9FwzIWPqEaTF1tPajfrXan
         hqJmwvdM1RxMEQ2shsSLTCvTCpN925Ffk+emfUCfbeoRc/l+H6+WdXdy1oVd7ypyVIkU
         Jojw==
X-Forwarded-Encrypted: i=1; AL+hErEkxyvy0+Q2hUWIgj03IPh8iuF6HtrE0f0+KgLe1HCOOdlP+GpFWNqll9idIQmdtRiuWBLufxxC7AcFMg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+wI5rcce0ctEqkiwqB+S+S6IshsPeiI0K0V2Xrq239XXAYutjQ
	ybfNYS/sCZWiOLSgdembL6cvLJiRzuTXOpPE9bac0MYaAbM/4uGSjNaQwt792CLyuqg=
X-Gm-Gg: AZFdTZc1aKHs/gRWAARlFGSboPcsY5d7HZ4Od8HSV7cqKj5XCSlCfBxwjVyufsYUxW6
	tT2Q5uPt1XbCUwnUx3q1NTHnbXDRTbe9DmMUjb6z1f50xD92iY+FuBzQ8/Q5mYQAUEgIaoFfSRw
	D2oC0h3Ib5/gTGNysqyWovrCeHaPcXFLiDj1pROFdU/vYCzPuJraxPgRA3USydTO7E3hQakUlwb
	NydR5p27rPTez6M3KRP+q3+WLZgeBvZql8XAL6TK5S0y1OgJ5xoy9ZiysRuK26eClyyEGpsWvp0
	dSNxeqVDG1obAYUhys04KFXV7Ytwx/6/TOJm4XllHZtZXssXwrOx6GFMoLKBjitsFLsJdjBSQPt
	IRI3SsxvyogYUpl4TOPGlZ+ewZS5/DdU5NRNDBjXfcpkCBVh9mb2e0KI37HYY5Rsh+GaO7IJ3QA
	IgNnL+4lUKUxmFLgst5oJUYuowKGGX99ZvSW+q985n4SC24dTwsddjxTUfxWublYSnCienMGOe/
	lH+nsM/LkMDwFfjO97Y3H+vU6/jZrO0iEWYj4CssUGXtWkmTW/3VYNTmX0sHOvftpIFGT9JW0jx
	9dWZeA==
X-Received: by 2002:ac8:5e53:0:b0:536:699d:9a22 with SMTP id d75a77b69052e-55d76aa8754mr328840131cf.57.1795617405368;
        Wed, 25 Nov 2026 06:36:45 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78880604sm157945401cf.24.2026.11.25.06.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:36:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWE72-00000001la3-15Li;
	Wed, 25 Nov 2026 10:36:44 -0400
Date: Wed, 25 Nov 2026 10:36:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 05/10] PCI/TSM: Add association locking helpers for
 evidence acceptance
Message-ID: <20261125143644.GF246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-6-aneesh.kumar@kernel.org>
 <20261123153507.GH179082@ziepe.ca>
 <yq5ald6h9r1g.fsf@kernel.org>
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
In-Reply-To: <yq5ald6h9r1g.fsf@kernel.org>

On Wed, Nov 25, 2026 at 03:22:27PM +0530, Aneesh Kumar K.V wrote:

> > That cookie should be held in the attestation driver and when we get
> > to acceptance it should be presented to confirm that nothing has been
> > tampered with.
> 
> We already do something like this on lock, we track the cookie as part
> of CCA and use that during accept. Sure if every architecture supports
> this at firmware level we can abstract that to attestation layer. Yes
> and this protect from hostile host.

Every arch has some solution, but the critical part is the cookie must
be tied to and exposed into userspace.

start returns some cookie ID, and accept only works if that cookie is
still the current session.

Since we have a uAPI that allows multiple userspace threads to open
attestation this cookie prevents trouble if something else open/closes
the session from userspace.

Doing it transparently in the kernel isn't protective enough, IMHO.

> But this patch is about keeping pdev->tsm stable in the guest. We need a
> mechanism to associate a TSM with a pci_dev. Currently, the host uses
> sysfs 'connect', while the guest uses sysfs 'lock'. It is not clear that
> we were proposing to remove that mechanism.

Everything uses connect.

Once connected the attestation FD is created and its internal locking
and disassociation scheme will prevent any issues with TSM hot remove.
Basically when TSM is hot removed it unregisters attestation FD and it
is attestation subsystem's problem to lock that, not TSM.

Once the viommu is created then the ref mechanism you build prevents
TSM host remove while the viommu object exists.

Together these mechanisms should encompass the entire uAPI we see
right now, so we shouldn't have or need yet another layer of locking.

It is why these sysfs's are looking more and more troubled since they
are existing outside the natural object and locking model that is
emerging here.

> Are you suggesting that the TSM association remain under sysfs control,
> while IDE teardown and TDISP unlock become CTLV operations, and that
> sysfs disconnect or unlock be prevented until the above CTLV operations
> have completed?

That is roughly what I'm describing above, it should fall out
naturally from building attestation subsytems lifecycle model
correctly.

Jason
