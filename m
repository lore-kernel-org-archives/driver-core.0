Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447660;
	b=KK4ZscH3MzSBo38TBgG040pR0+xcetH2QqXgBLR8jXiGJcJB97LR70LMzU9VPekZWe1H
	 kCOsc6ppaDvW+pxdlkotOtW7eqbipxZyK5C3OVdR+WeBGuVwDOTlli0WaK7VLxfqz9SbO
	 bVaKpI6MlfEbjCwADHYu0tYd/g8F1p5cF+TFi0Lzo+X+PqNA19pzVKzvRq3l8a3ffoyUy
	 xWkhHx9TiAcXmeX4l/aKUUBnDfePwvqSdy3lcQltOrnz5mqJZ5dBwmu4GhN4acBF5jSQj
	 U/BxqU6BcS+F0xlut1CgEeeyZSuzurubxnS0RP+Ig5Z7hDsdVBt45Ctu9IvvwLEj1Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rWLsIhN+kxPGKJoMsbdqyApLe79fwWP1AaQIjJntY6g=;
	b=myRbsevRhChtO2u9D4j5KwpYhgUPN4YugZOxv9k8SwmTf9gresKseDuu4MxXE3UDzoad
	 M3jrxzmhgVR8V08EU3bodf2EgqlMbY4AKwVnbZcndJqQ+EmpOOYgwAKHVUHqqfrEmJi65
	 JAGymwUnVhXONd8Pd5uXk8ay9O2b7KnhqZ7oTd2PPf2P9FdtbY7VcHLctcFNrVurszfO6
	 dWN4u4CbnWgix6a1wBjKGjaM6hekvkdwOuGlliiv5jrNbMzKQ4NO4MZ99ddPgEaxtelCA
	 NROpgZBFHIkWYgmyFx39oll374oYb1yKdm6pko1vJ85htszAtCRdO6ZYAA6Nm8MrE5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=OFB9sTMd;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75526606A321
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 15:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75526606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=OFB9sTMd
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55c48582654so40165271cf.0
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 07:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795447659; x=1796052459; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rWLsIhN+kxPGKJoMsbdqyApLe79fwWP1AaQIjJntY6g=;
        b=OFB9sTMdH8qL8kf+A5/ssPkVj4I6zD1lpDcHgEsYuApY2/1oH7AF4/w+xJ36Ngrrr+
         YMpAVORFCybBL/RQ1HSR/7FpI0Ex7yokNfpFScR+Up8ujZ/3Uco3pRQB18ktxHrRcJam
         C72HRS0RLeTemhDR5Jf6hIG0fUqe2G9Qoz81Zm14sOz+pG+j4wpY1CYHztXElRm3A2/D
         1kVkja3DPFsLe9BO1T6q2pBzVD0ht0EQBi2i3vulX5JEfT3D83p99D2YIeNAIl2aobiO
         lPz8TDu8fcrSIvHLpFcNOfBhu7DKIlWYCZjWbzKlWMhYO067x4GQ2RH2ons5vosFPexk
         Shrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447659; x=1796052459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWLsIhN+kxPGKJoMsbdqyApLe79fwWP1AaQIjJntY6g=;
        b=t2DBa9Q5WoG/gXqd1u7xaQ47rpiu5MNQoiBrXrrtfSEyY0nqwgQA68a7I7wol+nsS6
         aEgb7+oiikFHzIXVjYJIPj6fj7dVkph60yoyV++mN07JpnOyfCReuyKsGAva70WAyPJ1
         dT/0HLaRqIRjJnOHOyvBRLTvvJW6M4L1Tj7JAHjdnMj1xosaR193ifU13PLwhmD3MDfo
         BpXPoVP1GWEaJjPevq0sQYqsc1iq5YXoDCPww+LEtkmXwMDEeec9JENbniJ8Nu+EJhf4
         Lp3CQynbAwP3Ay+HjJGoDR8PA3E5IH9n1fLUKbCD8xsBj3oJ15wFfJWLypi8AKlR3JwV
         q92Q==
X-Forwarded-Encrypted: i=1; AL+hErERb9KlurYc/0GkMmfyrAnH7w+u37M0U9tIl3av32xlszFDy30ONyDm7rD+QFPpp79Vr5IO1ngV4cBHYA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9R8ku/cFt2XZr6IwpvwcT8M7GeciYY0t1eIaRnR7UBU8YYdqHV
	ceIaGf2TwHMh1uITRl5XvY9bbTRbljC1zYVnPyI44QpN6QCeSs/E/TnSFJiOYRzMz0A=
X-Gm-Gg: AZFdTZchQN7XY5p6wdEiugNq8za/0/NWHQY0Z2KlpwmKbxumADSlRwOXoTVgtmyYRXZ
	1rz8sfuzeFd7pf/b/JGoMFg4++KOltWZggxawbZsVL4KgpvSeCwshYZ2OeO/l7oXA0LjmlJc5VJ
	3zkaNr9jDcFrUNnWrHB7CzYDF1x1xcLVKmOI2TO/4RiLiOXiftSau3Ahjjke9YedsnApfofPybD
	A4boKms9mivjBsbxb6MfM0QVEXrU5CKwHpMkn8it+fc5LohcR0lCYu0r3koIibXqJ/lN8ScMfft
	pOiyv8nduzkFD+y68W7K0eP48PhMfEI12yFPfNXU1fWXSJi0XxUseh+D2TyniWLZVypmIi6X++e
	L5sylk+RJ5mqVAuv7P4sN6bGxqDIDmKKDaL3gQnjq/PRvji8ql5bwpCU+UN07FselF2FBD4WXxx
	QBQAaAq77MPDsfaHTH9FSoB1fQ8TP/4pe8SPn/VRsPrn6VpuMz91+dEsjPJIDUrBm7J2X7H2xMf
	4tovNbocrzChuhaEriHAoaIzMj03mVb/bQx8a/ekXmhoeK5QDSJnahgoVb4W0A8k8eVjdbRD1TR
	clp52hb5ArP99UpCHqkQoEdlVMoRMKDLfCGHGZ6Z5GXmCkLxSGuvqcpyNPQWjDorkH9IM0Fzmux
	WOzA=
X-Received: by 2002:a05:622a:1a8e:b0:535:2794:851c with SMTP id d75a77b69052e-55d76ac54famr221466701cf.39.1795447659366;
        Mon, 23 Nov 2026 07:27:39 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882bf70sm102842001cf.11.2026.11.23.07.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:27:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVVxC-00000000sQR-1ESr;
	Mon, 23 Nov 2026 11:27:38 -0400
Date: Mon, 23 Nov 2026 11:27:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
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
Subject: Re: [PATCH v1 08/10] PCI/TSM: Add sysfs lock and unlock for
 guest-assigned devices
Message-ID: <20261123152738.GF179082@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-9-aneesh.kumar@kernel.org>
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
In-Reply-To: <20261123083337.2731019-9-aneesh.kumar@kernel.org>

On Mon, Nov 23, 2026 at 02:03:35PM +0530, Aneesh Kumar K.V (Arm) wrote:
> A confidential guest needs to lock a PCI device before collecting and
> verifying evidence about it. Userspace also needs a way to unlock the
> device after use or when verification fails.
> 
> Add tsm/lock and tsm/unlock sysfs attributes for TSM drivers
> implementing devsec_ops. Writing a TSM device name to tsm/lock calls its
> lock callback. Unlock calls the matching driver's unlock callback

I thought we agreed not to do this in sysfs as we worked through the
SPDM stuff?

LOCKED should be the 'start SPDM' action in the guest
RUN should be the 'accept SPDM' action in the guest

And though we didn't talk about it there is likely some 'destroy SPDM'
action that is UNLOCK and UNRUN.

Jason
