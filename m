Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA05A2BB17
	for <driver-core@lists.linux.dev>; Wed,  5 Aug 2026 00:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891338; cv=none; b=oKrqgoPuNTcPgAsWFChlRGp1m2AAlCn0ZdvOL281wELXEEipLXf7DpJ3Vj1ebyOSPWmUHoQGICQXMljXCjgMLCyp/D0yvA8Dxhqa9aYiZgllxWdGg8XzBs9/4CXAr8ivRmCkyll96XE2DinTp1vYxdEkhiTYncFLT/mXFq2xeaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891338; c=relaxed/simple;
	bh=L0p0VCpSbh9Cfa3QK1gAYb1bq95q8GTSvQusPpTmsDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDKsvHnZ0w36kV91Q41adPWOipVxpcKTLJ/ttKDXgkWlXcmlk/ludOzH6XKX3pV1tp+hT6nGZ9rH4AfT6j0Zk0h4bbFq3bUI5oYsKhb6p3GJnjFliKWs8uRaIkZjSq7OXBbDpDHpiNx7plWxIgSq+5bceuj6IQjpGIUXegTrZGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BNojs1gS; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BNojs1gS"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-902fc790cd5so2877636d6.1
        for <driver-core@lists.linux.dev>; Tue, 04 Aug 2026 17:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785891336; x=1786496136; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L0p0VCpSbh9Cfa3QK1gAYb1bq95q8GTSvQusPpTmsDI=;
        b=BNojs1gSfvNERvVS71x2+pTbLtKvZo/3vmw4ippGZEkTox7SgaT3aV3034am3nSTiK
         8X0+NVxQTFcjMz8EJwVPcaakAFdRsdYeTP/kDz2k1VYqlAhLUcvlXnnmhM2x+zepDu3z
         fwkZbdclkk6GCnIO86cVrNY5Xr1LKD1zlgUGu9l4iShoZY5b5bhAq6HMfzxCwppkLK2R
         jt26i04sqAj5cxaIL26Vh1dY1P9fK1R7yR55359dPTNEwIQUUQ1LIAXQjehkZ+Y1M0tA
         pIiylyAYgixWUPrNQs2nwaqRUT8UcK7XgPY3FwOBUKb4cMR2fxUjmIkBLrARjGPlVbV5
         S8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785891336; x=1786496136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0p0VCpSbh9Cfa3QK1gAYb1bq95q8GTSvQusPpTmsDI=;
        b=KYRTJnNJJNLPLKlPfEw5ZrnAP2id4/G7SNS0q6kswNJq305BZ7/6KQ5NKAt68acMDV
         3zbgZ0CzYttx4Uqjfap46VCenM5/SZK8oNhtzFiiXOquaTwhNoWbUgFgmPgbHSpI2lKP
         sERbBUGok7gwoa95RZe+CbI1aj3tptWPPhZO0+yz/3YC0z5YK9o2zn4zojH7sg66RNLX
         ilCof0dFec3Vm2uKRzmBoof8cA570DOlF2nTVAvw6Us52K2mPS5vt5PHM1kL4i70s2Ht
         zVgP11g1a+Fuz/bu4gCNNlfTwDQLLmWhqjyrVhwxN4vCOa8BULhT3DH6wUR+PfjuUFVD
         c6bA==
X-Forwarded-Encrypted: i=1; AHgh+Rp08/lTnjuS9U8+4UM20Ek+t+YPP9kDVBz7A3YNyRxAkQK1cbuh+CcQ8aqIllYuOTx3cQce/hrIOR0SMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7CmzjDoVVssY++o0ewGekw/iVmnn3NGbOgDii5WlAw2J6DwAT
	fN4f++whOtZ/xKo0qeUfw/HH7FspISw4OLWk0g8kII/Gb2d3X/XJz1hdHlcq9q4qVuk=
X-Gm-Gg: AR+sD10ryR5f5YJOXe51LOOXACG8zJQsJT6jvN5Yjz0a3OYdrR38uH1l6/04V3mhqQY
	jZOcWRXFKWAqRfmdymRCG7OtbCTcelwnouDWiclF1Jg921jC6guhQzlpqg0Vsm+D77/Sty7weAZ
	YqULMz8GmuGQF1qEsJDDjsg5vOd4CbB9eLsPzC3LeGfLi2WLr33g0P3ComEE9CKpkmAeXigdaUY
	Yd3tItMUVPaikbVoNB+MiU59rMmHKZrt3+R7xgDDgZwROT3N/qk9QPxcO9/DzIvvncdwXLiQ7JW
	ApVCD/dkuKRaGjeei8CzVQ4KtuJHtKaBkXuHxTsTRs7Qc2kd+W9DQ+/uiiXi5qTR2jP0R1VR6xB
	wNYg+XSQmIZU8oHwZgHEf24JBLD14W27YVMl8SNjyQ3HSYa2IvBtjZo/Rq/W4tzG46YrIn0QisG
	jk71NnpaV/5hlUKghcv3coxHHqD32WDhNc2FkdGA==
X-Received: by 2002:a05:622a:58c7:b0:517:5b2c:6aae with SMTP id d75a77b69052e-52ce5fbdcc4mr38577871cf.13.1785891335649;
        Tue, 04 Aug 2026 17:55:35 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ce87aa1a3sm6538131cf.6.2026.08.04.17.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 17:55:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wrPuv-00000000Cli-34Ni;
	Tue, 04 Aug 2026 21:55:33 -0300
Date: Tue, 4 Aug 2026 21:55:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev,
	ankita@nvidia.com, Aaron Tomlin <atomlin@atomlin.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, Petr Pavlu <petr.pavlu@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>,
	"Fontenot, Nathan" <Nathan.Fontenot@amd.com>,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <20260805005533.GB28508@ziepe.ca>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com>
 <amk7Xzm5jmz+6SPJ@ziepe.ca>
 <anFE7m164AmchTy/@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anFE7m164AmchTy/@yilunxu-OptiPlex-7050>

On Tue, Aug 04, 2026 at 09:48:30AM +0800, Xu Yilun wrote:

> Glad to see you all here to make progress! Intel can also help on this.
> Can we have a meeting to discuss on these topics? As Alexey mentioned,
> previously we had a bi-weekly call, perhaps use that for our first
> meeting? Or what time works best for everyone?

I prefer we defer such community discussions till September, that
seems appropriate given some dates I've seen.

Jason
