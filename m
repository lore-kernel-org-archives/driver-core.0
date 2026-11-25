Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616400;
	b=YLOvasHTujDPQ1PUpy1BmzVNzrKlWB33o0wW0yvfM8sm6QMfz+/kDIoNDpubNsUb2ky5
	 MJ5qz9f3fdwWfvnFVvjXCioplH+u/vsdgRei9cn8BfbUUCFRRQwZXh7ylyWtLS36yVmUn
	 UV9l4FFqDePNdS9C6PURA55N9JpJy9K2Jf0fZwwtYktkcHUadj1LjKjI/i5lyB0k556tb
	 gO/6e6wMAw+fA9wLkx8JHSLFTkSQ6BD10q7CHBXIY7090SvoHdmo/IXqGmSVUyOkdY0fH
	 Yugl/vxE5iY9/e5r5115CCGbTTcMy1mPQhl2nmARL6BAqphbusfeb407nRDP9PQC5Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/sE+cARi5XYpGFmCaYKKwUnoyCBvBLnkQPGNB1SpCIw=;
	b=stD9yFGmVGnW5HF47zMc9lWn6lsdDt6OadlFl4KK4u90oIbcllNA6ROa1VA4t242aDmr
	 cfGAI7PXmEeLSYr6nZ/ykV/UV9OpCp+8q040JCbkOHprDv6rOvnc0Ji50th1Yqz1TlRAC
	 hCLpfTbVe9tAtRiMZtbtdPKGRK+GhrztzlFY2qCotRKGtoaODk47K3HWYpyoPErKIpRKB
	 zcu6oNdTFlQqVCBDycblKR09mHmQ5cssZqH8WGppQ7bdK6uADZ8rUp1T9pkLmLjADhhgb
	 Aw8nxqMjMGbz2M9iz2dGFuaBb0fWai4f0ZsG+wjKwIRHmwVqjrRqSiGhf9eQnmo0/pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FbLVGroZ;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD36606A323
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 14:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD36606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FbLVGroZ
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99c042cee7dso3136901241.1
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 06:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795616399; x=1796221199; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sE+cARi5XYpGFmCaYKKwUnoyCBvBLnkQPGNB1SpCIw=;
        b=FbLVGroZe/25+QYBXbt348nP/KMTo/0wN/vlMMzGlQe6KL0KHn2XV1S3kTi9qR843Y
         tKhDG6uWIfQDmLePpWq7uop6ZP3gsN//8fMRAjchZ/q9bA1eQhyto0IeHY7QA+KCyR8X
         4SnbGvTh2DPPuAbEOpORquswXXRhJsNU9BqzKcdKQXsxRGFP77e741urVMDlaYHtDOkq
         Q9BC7kxys2KmOnahfGU/KWNx87k8EplF3RZfMXiFs5d5PpD9iod/aJQsb/9lAfbKlDhJ
         iEiJr8wM3qzKK+X8fJEFwHT1UNZCbtWy8jvPhL8PrR+thOvEst1U4XIHx5jL+UNXnUVH
         NasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616399; x=1796221199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sE+cARi5XYpGFmCaYKKwUnoyCBvBLnkQPGNB1SpCIw=;
        b=CL/gJRE2ysleibA8NwLXBym5avamxk+HMkDYeNYQiBXelG335+AVkhIy7z85QE8osJ
         tqiK+PW4VssDE2Ha91sZrBfDtXiS43oAKe0bcHoDYkDYcWzPueVUvIO9G7LOVlkhGWEU
         ebu71vx753JXDjjLJydMKCureqpilfgX1Tr+QoNh4cLStuL7I8OW7dzietcfGSr4Jo9E
         x8zEGvVl3maM5g+Tig8tQxnw4EEELLrsV3GLfR1RnFcu+4uOYCqvBU3tMJo2z6JGAN57
         X9y3quu2tWlfFzYbuAQjch9BSf9WSmc+Ux5Xx+OaIZh336ToJc2vo9oV0/kz9WCWfxaz
         clig==
X-Forwarded-Encrypted: i=1; AL+hErHfizXG+0l17YoojTSZlqrpQjpt0td2s3yvpqxA/ADJVizBzoTS6WLgcnmu/gwBJ0qF55xWhBl9Wk7DHA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Z/xPGhGaWVafxlV2XBLqKkZ0A3/zWvHhaRr8SzpslYu6LUfz5
	pkz0RIQ39a1BETtm1GwzIXiHmvq5bklXF5/jXiPD4i1iyY2KZOkjrWOXA5/pmjc6ZuOxECItGW6
	/S7Ml
X-Gm-Gg: AZFdTZeQilnEyCOeWIeryB2mCUspCyf2a0nmeZ7L6+O/aUpaceptk4dNcq8Y9c536l2
	Qp9Yzb5Kqq9NnD1t1Mu8bn8ZwQR9doX1tyTY3MQU5kINNj6DLrPnaotFrDbhmkQhl8PJsuU6r4D
	PrN/7JdQdxM4QguB2bL/OI7N/iL3M9UUGyNA377yNsDO8b0GV3NUKwjtm/5w/kSuMQ2t2kBo56x
	1wfZBPd/PEUA+UihU8pkuiV9+Aov8qBeeOt63TOE0WiM51k2qpGV5KqHj/eqN1SSHHtYwzbrCaL
	Bb7vZ7DF3wGk5/QDMPnOhHa/iZ6ehcZQR8sByR/ETZ1T7KyP+24uubIgSz352+W1h4Qc8rdPQsw
	aQWh6yCfoYq41Kg7iWvuYUiBm7WbvWRZx55WWINCaK/R7081luB45v78YblRWsZ4Drz7DJLhOQi
	wnreMtA/Pvy/q65tofpir5G9rpmuAw7cKyiAnvIjtarlNCB/EU+iv7HiChznaSz2Y+ZF/cTWr3R
	SHLZQBZi1l1GdqMHNIDa6xkepyxk3xabkKusK0x62khA15ogDQXuI5bhzz0UpCij4p5rytvl7CC
	trNN02QitSrMziNluTyjJodobug=
X-Received: by 2002:a05:622a:258b:b0:55d:3789:8c8e with SMTP id d75a77b69052e-55d769e11bamr337179531cf.15.1795616388597;
        Wed, 25 Nov 2026 06:19:48 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8absm153708121cf.27.2026.11.25.06.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:19:48 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWDqd-00000001jay-2IOg;
	Wed, 25 Nov 2026 10:19:47 -0400
Date: Wed, 25 Nov 2026 10:19:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev,
	Dan Williams <djbw@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 04/10] PCI/TSM: Defer TSM vDEVICE allocation until
 device setup completes
Message-ID: <20261125141947.GD246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-5-aneesh.kumar@kernel.org>
 <5e04323f-dfdc-4956-acee-bcc09926726d@amd.com>
 <yq5aqzg99uio.fsf@kernel.org>
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
In-Reply-To: <yq5aqzg99uio.fsf@kernel.org>

On Wed, Nov 25, 2026 at 02:07:19PM +0530, Aneesh Kumar K.V wrote:

> That is what this patch does. If IDE setup is not complete but the
> device already has tsm0 attached and connected, pci_tsm_context_get()
> returns an error from cca_vdevice_init(), preventing the device from
> being assigned to the VM.

If the device has not been fully accepted on the SPDM side then you
should not be able to create an iommufd vdevice for it, nothing else.

Jason
