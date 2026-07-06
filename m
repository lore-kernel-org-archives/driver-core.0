Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756DA29D265
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345758; cv=none; b=h7O8VW5/GzJMatPCPrMw+jFXGQjCBopxLeVzd+yqPpxy37azRf32ENVhieocaWFhDhprgt9gccFUbuyaCjVa1BAbG5u0x3In/aWXNpnTjt7mqsK+t65anpEjUnLofAJe8ajWNSeOMAvSeNCGxpm3W2Yv1qESOqNcEIsfuaDCtdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345758; c=relaxed/simple;
	bh=RJdYQi0PoM//5hK9gN4bBQ9zTfKlUTPFi/vPWsYCK8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFV6whmB9TW6yAsbzRl+l3D475rY3UGAY7S4ZhrFSotK9obrnX/wdvwPZOOYPJIXjFC7XP3xPYTnEBJmUQoM3LJ/E6tKXISuhQbgj2SXaaZwK727sZiecr1NX/h5B8DIgcBkkvtTvcaHjDW4jaG+4Gqci1KsgAlyQeSGiVBhk7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=UdadL68U; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="UdadL68U"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8efb708b1a0so27783376d6.3
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 06:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783345756; x=1783950556; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XwHo/0YkkJmp15u3gq5DlM2DOcKv24yUlUoqLvzeWGE=;
        b=UdadL68UkI0sN7sAqK/3vmelT5Ylw5m8ScGxsxtCfycMbQ0PCk+6P+hkJThIJzV9fQ
         obzjnRt4YPST9Fv9tHdsdu8nHMJhI27EH1HM030jvUtqxoY8CzfdtCHihKTN9AsPHiib
         jlv2wbuUrcfO45RTI+1kW2VpzMd+XV55fVNfB7z4zRIHFtERXdHp9R+yReYpK5GHZghe
         tYRJYbZSpBCiDPNYBNFnuP05DAErgMJW3Yp1BaEl+Q5T1DM2ul1ioAsmfCZf0q4miRif
         GYRBAtAw6Fmn3ggVX7rubnJYeX0Qis7Mjui5ZbmnSI/wSbZZ+zQgbjK0EiwTGczWp9Ho
         JdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345756; x=1783950556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwHo/0YkkJmp15u3gq5DlM2DOcKv24yUlUoqLvzeWGE=;
        b=LHDZN+/65s76tZXVgp3mFA2WaH7FrXlArCdZoolXnBmpLABOfioTkGxGvJ19NcGaYg
         tbs9V27J/tfsNc/uWiauxF/5u9Sjszokc4Czut1tOwaV/YE7qdOQZ4D+MajoQDY9ATuq
         ZR92yqpInB6517PD++JvmMGCHTQZ13RqNQe1QP+GQy0IRVR6tcPXpkAGBaYmqaEd6myf
         vHOl8GaK6XMeV2uVE3OdGwV3HiL1LVo8l1hxBQRaTWNdkhWNYL0Sr9DYohYKsfGjyKyd
         B95JkLFP4emCAtm1s7pCpx3ND5hGneprJGIkHvKEG+sLf6Uk9MWKt4ZdMPeP5sv5m1em
         LZkg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4oThH6CzgPkTFlW7jFGvg50GU1vs4YX4EwnQy0GrOyJVv+uGBx+J8VmhM0jp2FTCqeqbSFYgycQaNug==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZHcSu860T/maJDzA4Zvf2rFze0mgX5s3p7gQIRtIGt1Iq2cPQ
	X+YuNR5i00J+lcXBHH6qQUYDKwKQqfTdOMacAyZbVmZ7N5e92DojUkvta2A3nyVcaQU=
X-Gm-Gg: AfdE7cmeAolsbjH2zu+4w5ZBscjVxw4GP56m3TXMcNE3gZrDmo/lc38FsKOKknxkCab
	tzUf+lcaRhsurPhGP1TlibxUC2Z4xG24QoqpeMJ9gkyrrkBLaMOOeGk46lL0o/VM3Ldra9jJsBA
	GiTt4/OSmfzhDXyzCPs2Jv1cLPxWwg/qZUw0bGdrPSwdUbB/9tgkKCUv+iCEsNUBYuoAzBnYOYr
	7wnCQ27oAwfmHnQg5SYu68PCEWQWr+0b0PaWFoE8f6g8Z1DPNQQ54DNqycjPsD8Hy8jtuF0q6LG
	rPRATS/NIrDFFYgTIzCrcolntyROz6cdWlGM8NEl0ZlHGCnd8NfvUdMgGwWplHxNcQ2WNecMrc6
	npPz27Y5Vdx3ChG0rDlm4hzWVWleIKMOU/WEDKa206dJG1IvT0dcE7MF80E5c
X-Received: by 2002:ad4:5aa2:0:b0:8f2:fbb1:cec4 with SMTP id 6a1803df08f44-8fcb2893eb8mr6044896d6.19.1783345755411;
        Mon, 06 Jul 2026 06:49:15 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f4718141e6sm136628496d6.24.2026.07.06.06.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:49:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wgjhC-00000000T1F-0z1i;
	Mon, 06 Jul 2026 10:49:14 -0300
Date: Mon, 6 Jul 2026 10:49:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <djbw@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	driver-core@lists.linux.dev, ankita@nvidia.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH 09/15] PCI, device core: Move "untrusted" concept to
 DEVICE_TRUST_ADVERSARY
Message-ID: <20260706134914.GD107792@ziepe.ca>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <20260705220819.2472765-10-djbw@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705220819.2472765-10-djbw@kernel.org>

On Sun, Jul 05, 2026 at 03:08:13PM -0700, Dan Williams wrote:

> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index a08523d348d8..a4233bdf9804 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -291,6 +291,14 @@ config DEVICE_TRUST_NONE
>  	  possible, the device is blocked by an IOMMU from accessing
>  	  assets.
>  
> +config DEVICE_TRUST_ADVERSARY
> +	bool "Adversary"
> +	help
> +	  Device is allowed to bind. Bus, IOMMU, and driver layers may
> +	  react to this trust level by disabling access validation
> +	  bypass mechanisms like PCI ATS. When device is unbound from a
> +	  driver the device is blocked by an IOMMU where possible.
> +
>  config DEVICE_TRUST_AUTO
>  	bool "Auto"
>  	help
> @@ -317,6 +325,11 @@ config BUILTIN_DEVICE_TRUST_AUTO
>  	  a driver and deploy all available mechanisms to allow performant
>  	  direct memory access This trust level does not grant TCB privileges.
>  
> +config BUILTIN_DEVICE_TRUST_ADVERSARY
> +	bool "Adversary"
> +	help
> +	  Deploy mitigations in the IOMMU layer and driver to limit access.

I'm not sure it makes sense to have these options as compile time
defaults. Arguably the non-built in path should only be auto or none
and everything else should be handled by the initrd at runtime. If
necessary a sysfs for the initrd to set a kernel default might make
sense, IDK.

Ideally built in devices should not be any kind that is hooked up to
the iommu.

> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 9abaec0703ef..957ef77911a9 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -588,16 +588,11 @@ static int iova_reserve_iommu_regions(struct device *dev,
>  	return ret;
>  }
>  
> -static bool dev_is_untrusted(struct device *dev)
> -{
> -	return dev_is_pci(dev) && to_pci_dev(dev)->untrusted;
> -}
> -
>  static bool dev_use_swiotlb(struct device *dev, size_t size,
>  			    enum dma_data_direction dir)
>  {
>  	return IS_ENABLED(CONFIG_SWIOTLB) &&
> -		(dev_is_untrusted(dev) ||
> +		(device_untrusted(dev) ||
>  		 dma_kmalloc_needs_bounce(dev, size, dir));
>  }

I think it would be nice to use the new 'adversarial' word here and in
other places instead of untrusted.

Jason
