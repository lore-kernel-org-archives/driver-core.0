Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A1822D7B9
	for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 15:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452423; cv=none; b=VOVp6dq45qO5KLLlo28WTyrE5RHSDh9C43m1og/JMvj8K+Pq3kK5I4u0+xN5V5vnlM4XWpuTTB8+Z21FO2mDeo4VhxsH4K8v7in+8cj823OxTnwOfv5zmbGmdJ8eK11pzzwZLAYAptaFfufC3gEmr2MA59a8lrsQgZ6lFSCabrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452423; c=relaxed/simple;
	bh=4zJ9kuB4IKFJzdsZpa3R5DFf2TSSq4O/xCkauElOD94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DF4QKm6BkCpPJH1zQqQ+Jnf8eziJJ480qRRg4Nyr08aG11vkA7Mt+qjWzdCYRbci2KEN/Uy42Y7ScSI9bjW4fjI8GHWlFQEDpAYCMzYRDEKsa/1woTpO4WVOc66LizUP2iC0yvTmJMEjZuATQ0z+PsxCyhNzXZs8uX3yC4QS6i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8zbm++R; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8zbm++R"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12713e56abdso593763c88.1
        for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774452421; x=1775057221; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=khgSvsFz4BGruQneZts97/YH28J+KXY7YhwPuOZLH0c=;
        b=a8zbm++RhfAnrdumymwAXla1CgmY0Yqv+lzNhcpHorFBF65S7MLfj6/2Na0pptbLeL
         P982luxJnezwjN+uSJ59ZmCM7SUuYEVDmDrm8kuCl59Z88xltYNx3LbFEQGnXH5T8D3Q
         m8fUrtN1Lt0b29a18++IS6u4yD9LMPbGfHCYt01EoKBXfc6drIvNxU5PpCcDeuuufHaS
         PJvFVBJLD89xB0OGNxW0ne2Dx+1IauDUDk2u23AtJc9ZZM5shXUcpxEOjR1nkAEptuR1
         kDhkn7towurXKnG+0aofc7ZS7vy6vTCsQSl2J3Gsr/R07lhNz5d9an9xVYmC0WNltAfr
         qSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774452421; x=1775057221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khgSvsFz4BGruQneZts97/YH28J+KXY7YhwPuOZLH0c=;
        b=jiL1FYiSF5iIZpn+TOBXGAYKuc+8VlZbu1Q3YGz0RB4/6Hr7Udq6L/8Vty8aOYrF3R
         jZ536r8rbkzC3NP6Rxh44F4G1dMe/QqtocvcetTz8G7EQQk0i03aP/2whTdpXERgpoII
         bXQ/xKdUmour4YmZcXEwINfyg+mOWkLx61H7ZW3p7ey/aMLzz7x+5mDasShUhf15B2oF
         ZJOPGrStvXOqlNrcT6Zw/QrqCJfRzGYZSpdRcR96CQOLHV8ql2SlpkLiYBHzwm8Zufei
         Od6UQAdh7Amj66GqlOgctTrjjYNB4lAEHSklodg4sZPeVOpH1Rza7ntnhfDYgTd16Ixv
         h0YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwghso5Hzc/esIsDOAWSYaHw7W72DVYiwQU7FHkv7XM+jpKJaOeTMeatIgRXEt7GcNZFL8yxES3g2XMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkXbkJ5wNXMdd97mQ5VIpbf8Oz5xxc+f4afoVHKKypyc8gp8mt
	ADNT5R40lfaLbc0zWDPGaOpEITzq8/rlWxE2zLwq6AUU8b8RjKhXSCXH
X-Gm-Gg: ATEYQzy3aAT65VvU4+1ovXYNhdPCiZAu+D3ut1/0cPWhTad6Mkx1AaefqAimB5vx3/J
	QCOf4x4iUECXKOHLcCtVXxGUUPTlYpr9E3v/Ee+5ubk28ltjh6XiQnUN9VNOvIRSigZywOHz197
	ZhIBHIr6MIBjlIShhA/R0j7AKqKS7lWvXdRLEolyYRZ4I7wJOYRZUDd96YW4yVK/Yh7Fil5xZyw
	SFreKmsF3J9B2gp8OwYMA0u5aYd+f2E71kQjT6TYJwLuUnkGoaOlC5MX+3hXPOl1GQb4a/Xs4It
	jHltljYaWI8LPtzFYGNkg3VoLj+tbg/PZC9H8hHWegMDRalUmIDTZ4hhqbS8JYsJ+yyb+Hz4sB+
	KeK/Ko7UoXvg9e5VfFoUF2Yc2+dY8U9NvGCJF1i4IkuGUgiCXZCzEL7qOHrT0N3li6T8+Y+j5ln
	13WcqMBbgZXBMAldmpOHmTleagjj9Lxr0GOU6Ep9aG4+2meY4Phso8Cm4iMtH+8Ky4
X-Received: by 2002:a05:7022:220d:b0:128:cf41:d6e4 with SMTP id a92af1059eb24-12a8e1682e4mr3485083c88.21.1774452421364;
        Wed, 25 Mar 2026 08:27:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa76243desm44594c88.9.2026.03.25.08.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 08:27:00 -0700 (PDT)
Date: Wed, 25 Mar 2026 08:26:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Grimmauld <grimmauld@grimmauld.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Message-ID: <acP9-AfUQ7zp3kMS@google.com>
References: <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
 <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
 <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org>
 <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
 <acNgUoWWMCi1oLU4@google.com>
 <DHBYL7Y262J2.263EOC2JNN4RK@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHBYL7Y262J2.263EOC2JNN4RK@kernel.org>

On Wed, Mar 25, 2026 at 04:13:03PM +0100, Danilo Krummrich wrote:
> On Wed Mar 25, 2026 at 5:13 AM CET, Dmitry Torokhov wrote:
> > That means that you are kicking the majority devices (for now) into
> > deferral path. I do not think this is optimal.
> 
> That's not necessary, we'd only need to kick those into the deferral path that
> have PROBE_FORCE_SYNCHRONOUS, no?

Yes, it may limit the fallout, but as I explained in my other email
there seem to be a serious disconnect on what synchronous and
asynchronous probing mean.

I wonder, don't we get issues with phylib in other cases? Don't we ever
have a module resulting in creating a phy device triggering loading
another module on the same thread? Won't that result in a warning also?

Thanks.

-- 
Dmitry
