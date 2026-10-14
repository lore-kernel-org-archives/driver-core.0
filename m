Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E190751A155
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989894; cv=none; b=rpyMCYWGdbPqD7toltnIxGkNIY9aGpAly7/0nt6hssLITgYA8MxA0UPS5sO3HpDt4hnPhOV2M4+ZGyaOrgcgx5Iv7qwdsNqrBN5sdJSXfw9p1nleqdBCQVtofXHjVejt3F39k4h+IUnxGUKeDyyu+TT2joABEYVI7wpeBxqraE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989894; c=relaxed/simple;
	bh=favv20QUS4n0s36pVO9/Q4DOlqW+akAGcEKiNfXx8po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2WX/uITee8mFUZ9akZyuTlwXK1BupZvNOEdEJe/pp9H1TZPh6L7cwMwDtEh1n9xJJKM6oigx0M8QRdGPcHrX4gTGLQoUGtPYTcKe232wBq8CyS1ry/yBLRCaKgULoIUdDbF2y0GgGZzDopBM8Hq84IFQATCPfSnibQPA4j2u/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HaIKeoQI; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HaIKeoQI"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-530e75d1ba1so42165751cf.2
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791989892; x=1792594692; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=end4sOICJSY4jXS2ggbo5B9Zltmh1/qgwCGH+E3RbsM=;
        b=HaIKeoQIuj5NmNgMsrzIqEHPfSMo8zP+ocXvKJMW0vERTX2fmcKtXgqRDU/spgC3TG
         9jO76h3/sgbN4KkQFRpf48vpiclXxJPLi1xNhFYdUayFao9JXoexuRc1BODtG7Ol1oQy
         tbY1Ha8JWoD61GMtBwAmCLLhtOj5X7c5GdSlRlHSJof/ACodIl79hPkGi99KsxzCbtpS
         zAYkk6H5vRq7ujgn9K/3QKp3OfOQ33xj3NWHn63ann3RwIgb9Vc24SOQZxLtpoVZPIcm
         K4QfBuT5vsPPoKV4DhIRQ35dfjb5MsGad+/wQ/yMYaO8QKXgnOJ/m0VbJw03qCyU9bHR
         2UhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989892; x=1792594692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=end4sOICJSY4jXS2ggbo5B9Zltmh1/qgwCGH+E3RbsM=;
        b=pRrtFBR5qAqfq2VjmClyFDr6WpTPslPsVQevDit6YUjoilxtLG/f2JtX2SGeaK6H9a
         WuAS8NwMDZHlatqJEyLI0AvE3DIA/4drc7XN22MCtPKA9Xx5MUj7xKER/KnQxa/0czvW
         qK4eNRlVlu6u0/N6P8hTzpydcXcAiX6+eM1b+dSnlT0Ci09AwlnGTDxLDJ/MxXNSkg6G
         na7zAfD3rMSFxmcMTZqe8f4LkiPzW7fLl1Iev71jzM34pDt0IM7i5SGQlZc2lXfpKwIG
         x2FMWv7IHqhqellhF5piLju539kJDCNZWaR6dlmscg8bwH7VclWfa8AyKsFur8fZtO+C
         3mig==
X-Forwarded-Encrypted: i=1; AKwUvByZG3jXiWnnE//jSXa/bQ8wysv+FxG7CXqi3u7UpGPODy4aXCk2upBiqP0E/6RL3yx8QR9ctxXab4zCaQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJqBpv17RNBZ92DesNA/Vv4ZV1CJDyp5fo+rjlAnQS6ERbbOCs3
	CmF3G/vheTOdp7YEH3GSXdRHgV2KjFUvzboFzPKdDYilobKvuG7H7qQUVdC/oQfPsA==
X-Gm-Gg: AYBFou1TCnVRtObF5q3aBs89V5naCl465tOruqxFAjoA3ryEqMZEl8yiw8TR9bT6Dbg
	nE1QXT3TglKVFDyr1rU4lFEVcJSg6yv/c9+Tuf6bli7SdyF7VPjX7ebcjrAvEx4DPe3ZdNVuuez
	JDpTpBflO2mYiSoMxI1CpktRlrW/HSgpdui9Eu/JRcLq7OSmztGxnu3b4p5yUIFjxJbPRiqWDhT
	S9EjPnaR4+83ngp7rMN94bcYwLytQl482Zk+c3aL38JsisVBoVtuk9cXzrx2GZ5kHTIy7VlxCVX
	708ammbQ3NUTkQUylVUi0iWc24qYFBO3y0qjJpv+ye/mxUnsw+hp+Kd3glLyL10G+PqzDBzItiR
	wZgoHd+yXCuKTk/FENfC4g1ZmwjVbfT4XNnlst7koMzBQHEy/Y1vPV19dp4Oqe66RQpyOJQL56x
	3Y5DduABJ8clK0cxLsqk1IQrCcaKSEjIRaeykp+Ry17heNToNgySVQz4lU8GMbOnWuvVq5WIXQE
	LWDgoozdPG9XyROCA==
X-Received: by 2002:a05:622a:8ce:b0:530:e1b1:eaeb with SMTP id d75a77b69052e-5359fa73749mr239755861cf.21.1791989891598;
        Wed, 14 Oct 2026 07:58:11 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b6fbdcasm126177791cf.5.2026.10.14.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:58:11 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:58:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mario Peter <mario.peter@leica-geosystems.com>,
	driver-core@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] driver core: fix parent lock use-after-free on
 USB disconnect
Message-ID: <90cff929-d12b-4bfa-9b30-19319376289f@rowland.harvard.edu>
References: <20261014133109.1392265-1-johan@kernel.org>
 <20261014133109.1392265-2-johan@kernel.org>
 <DM4N7SKUMF98.32GW04E2EVM8I@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4N7SKUMF98.32GW04E2EVM8I@kernel.org>

On Wed, Oct 14, 2026 at 04:49:31PM +0200, Danilo Krummrich wrote:
> On Wed Oct 14, 2026 at 3:31 PM CEST, Johan Hovold wrote:
> > + * @need_parent_lock:	When probing or removing a device of this type,
> > + *			driver core should lock the device's parent. Note that
> > + *			the device must hold a reference to its parent.
> 
> For the reasons described in [1], I object to making subsystems responsible for
> the parent reference needed by driver core's delayed accesses.  The driver core
> should acquire and release that reference internally.
> 
> [1] https://lore.kernel.org/driver-core/DM4N25JXKTQM.3K7TP9HM68KQ2@kernel.org/
When is the appropriate time to take the reference?  Since it is going 
to be dropped when the child device is released, the logical time to 
take it is when the child device is initialized.  But at that time, the 
caller may not have set the bus_type or device_type.

Taking the reference when the child is added would work.  But then how 
would the release routine know whether or not to drop the reference?  
Add an extra flag bit to keep track of this?

Alan Stern
