Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E59476CD2
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 17:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458017; cv=none; b=uu5UsbIn4BEequTgyNfj7pn4YM5hiPi/6MheU5D5s+Hmk7OCZMC0OJffUMVnCdCLhn8HSdoRQWNU8FuxlpiKjMzKGHQgnpqaKDi6dN0LvzjSjQ2/soHbnIhRhVvBlK/eX3BUWRWI6CuCpb+A0T+gc9mV57UKWuUFFH4j+gIxd/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458017; c=relaxed/simple;
	bh=DzQDxkkXEH2+Mp8OUsaYNxAH3LbRjRgBZk7gary7lQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgF7NghFL1ftPJvwsk9HhVTHssjd+Polu2hScmq3bMdnNLgPbEn7Z+oM0FG1ehx0d6TWLqSf81AtxtUlzcToneWyHZVI9yrf6rgnTXs/qQ9dRNSJRPrOcUGVE3RaC623U5krMzQqgnydZ0WmUOqTURt4tHAvnLQQ3M8Nxi5JepY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=mHN2U3G7; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="mHN2U3G7"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-517dc520840so2350581cf.3
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 10:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788458015; x=1789062815; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d4rOxY3h7ZQvpkIblsAFRKEuph26UmxGEHCOpw1rXj8=;
        b=mHN2U3G7f51HI4mdxmW9ZGbDhO4YtDIljvyzwcCkbOjObph6tlcJnR8i8fTlnrChku
         7fGGpQiEqYHotIb4IKMsgHq60EFMaehFmiyME/qvZiX/RMYmeFUvIZheImfvC5hsaYwL
         QHhKX+di+Lw/6298sCnZhgHihRQ4S1NxFQUYYOZ8vdZ3/EpAIFtrGWqgqVyF99KY6SbU
         Y8Ut3XGgXyAV4uxs0xIS0xnmZMZnzdbydMOZf8dqO8OElOScQra7mbk/i8RmHK/MpgMT
         QBzQyioeErna9kGtpUV7J5WAeAmGYQUQx1aHVB/fTdIQgp2Osb0j3lAWfUwABhAGGdoe
         81lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788458015; x=1789062815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4rOxY3h7ZQvpkIblsAFRKEuph26UmxGEHCOpw1rXj8=;
        b=AYU5flggKg1j2hyiTUpQD88F5vl9w6VHlLFcU2FIGteW8w9L2vYGS9tDlOVxXFcVr6
         oVDOwNO8SE9xyTXMeaNagliIKdqz12V8Q8L5PdKaIzLfiUOgcdzXtbOY+rLd1DthzHDQ
         umPgbTm2sNOiEt8fQoZlVkXyqO8tJqolo5d6SsNKDov6UEhKvtfNesOKGNiodEdsuwE6
         Ha9gUfMnX1GSVszLXOZ2ckWWgfaUDiuu1z88TSgIPy2l4UQwRdXGMon2jBvedsHEnU0M
         PAPUTu/QxnTEuLQyy3ZWiBOesYYbgb6SyxtZ+GNEYRd9YcFXRQfnHDeOzsfqHjYElY5s
         n8+w==
X-Forwarded-Encrypted: i=1; AKwUvBwN8U0/qMcIqZADFm4ZA0D19Bjg30Spffvge7mSw9cu9tpnvdRmARiN2B8rVgmEqNEIrzmvQitX5G2efA==@lists.linux.dev
X-Gm-Message-State: AFuF++mmocIGmBLy60uIhZWbVbYECSX6KsRZ9lie5MFmnuTlnyA/4Tmf
	JzJ1yNMuMUfIdr8Nqfz3/Fp8oZicStRcWws25wEcVPgCO0yWUvOj5TK/hPnKCBUkn4o=
X-Gm-Gg: AYBFou0N1wMDhZ8XKPFMzTqATQS+n7rn6+JwLtc80ft4IQebsv1MWtfbqJIEjc0v7nU
	jNjuep5RXVM1MVctYrttaTP6xSz+ggLS5a7skMgB+d0FyILEZKYfo96jj8wkTKk6YnyNOW9rarz
	S4Ze0rSq5/cycOYIT2GOahPenKycInuz3Cq0ZqDh+ZA6qn08onSicO4/ALkZv5xtWmCT+Sj028s
	W9GOAy+qOkaic1XQMwah62aJhjGp562+QayOFwTVOs2A+8NSNJNvbl1YXOyYN6swAHcTttdRfrP
	hXEzcqHktnxjCWHxx4g8ENxAkiq4fPVP2CAG7YB379nC42zkIrm8l82OxxCupQ7zt0RqyPu4FL4
	dijK005Ucmyf9OyTyjlCvT4t3uEydxswlpZwGDv0ILVXNL6s9GTFD7CoDW05To+gU6MqkbTKHUd
	54hnI+l0Ld+g6Vz3DO2V9f4wYj7uD4qteKPku7m4cjCCYtzQZ9hPuzX2FlwtjxGT7yM9+HhBfLF
	HZgsZd9PJBQjQ3Kt7poTKq5V1C1blZgTptQ1fbD729HobI5F4iYsgpN
X-Received: by 2002:a05:622a:1389:b0:52d:ea18:a8f with SMTP id d75a77b69052e-530548e2cc0mr6156201cf.29.1788458014775;
        Thu, 03 Sep 2026 10:53:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9103f22afbbsm1823116d6.8.2026.09.03.10.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:53:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x2Bcy-000000001zX-35Hi;
	Thu, 03 Sep 2026 14:53:32 -0300
Date: Thu, 3 Sep 2026 14:53:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lukas Wunner <lukas@wunner.de>
Cc: Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>,
	ankita@nvidia.com, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev,
	Aaron Tomlin <atomlin@atomlin.com>,
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
	Petr Pavlu <petr.pavlu@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>,
	"Fontenot, Nathan" <Nathan.Fontenot@amd.com>,
	rick.p.edgecombe@intel.com, yilun.xu@intel.com,
	Jiri Pirko <jiri@resnulli.us>, Leon Romanovsky <leon@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <20260903175332.GN2890729@ziepe.ca>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com>
 <amk7Xzm5jmz+6SPJ@ziepe.ca>
 <anFE7m164AmchTy/@yilunxu-OptiPlex-7050>
 <20260805005533.GB28508@ziepe.ca>
 <apeF/peEzdxvKeWR@yilunxu-OptiPlex-7050>
 <2e721509-0aee-47ee-b17a-688876e02f74@amd.com>
 <20260902150125.GD2890729@ziepe.ca>
 <apl39vOiMPP7VloW@wunner.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apl39vOiMPP7VloW@wunner.de>

On Thu, Sep 03, 2026 at 03:36:54PM +0200, Lukas Wunner wrote:
> Dan was added as third devsec maintainer to host tsm.git:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git/
> 
> Jonathan and I retain access to both repositories.

Fortunately they are on kernel.org so Konstantin can always recover
anything, we can get to that when there is a community consensus on
the new team.

In the short term Linus doesn't care so much about where the tree
comes from. Personally I'd rather leave that as is until the new team
is ready to put work into it. It looks like there a number of things
that may need preservation..

> > This is the only time Europe could reasonably participate in,
> > obviously it is not OK for China and Aus.
> 
> FWIW, I'm likewise based in Europe, as is Jonathan.

I was wondering if we should try to have two calls on opposite
sides.

> Obviously, one cannot separate discussing Dan's work from Dan.

Yes, please lets all have patience and understanding

Personally I feel seeing the overall work finished and products using
it in the market will be a "in memorandum" dedication for Dan.

Jason
