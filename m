Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE7A3F787F
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432452; cv=none; b=OymLn/JN1XbnzS6vtNzaDk3CRCiArGAED4lfE2CgPjY/qElx/hofcJLbsIcekv6FCi+niSdaTvrO64GokVr2VtR9brmP09VA2oO98OsUeFHG0a0Xyeca3mhWKqVNNuWmsZun+Mau/8ziyaJGjfl/KB7WxxN9KpF3LPWz9+D5Ats=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432452; c=relaxed/simple;
	bh=JgKqENFoGD+r2HcLqI6QzwLYU+u5xX6ykNoGtdPOJIs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FOXLVEx8MgQSqK8THQdHZKC5RP6V2vL31JrtKhpyKU2vux0Wg1a06JOV3zZez5LLYVSZ2YUSwbwPQEFzLFDiyOwCnXYfs11gD6YxRD2+ENrdaHxqnjjJi5IPmJgl6sma6i9RgbAzTpk4096xjALHkPV0hMvW1VSZV+3LrbKHAjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FwbxtRlk; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FwbxtRlk"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493bdf90adaso33509325e9.2
        for <driver-core@lists.linux.dev>; Tue, 07 Jul 2026 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783432450; x=1784037250; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h3qQIydnrntueQidkz9seiThuCHjKGkJFQ1LDomdEzU=;
        b=FwbxtRlkpAY10Ea86EYUCCfbsmQfRnxKpXNrGpEnFzJFolne95xSp0JToLN6B2OPRt
         CcDXobzm0kX+3hGryhumR5EpDryJ+bbdh0aaKUdVMUcIqw93hldCZDigjmabT9k34Yb/
         knHTDe7Vtqv5SwXnJXkAnsnGo5eH6h8zaHqQSte8wtIntb2gjYgQqunJMA9ZY7ZBk+nI
         5CtDZey1COCsGSzuxylDZRWHWyXa41UYapUPTKqYFfda2L6xroggBKf7qAaWaXxlvR7r
         b9Lg4Oe3Pw7f+i2NtXMlNoMSUrGYcayA4ez6rBDrFyNR+qWcC2VlT6ilVQEvxhSXAojI
         rYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432450; x=1784037250;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3qQIydnrntueQidkz9seiThuCHjKGkJFQ1LDomdEzU=;
        b=Qb3Z2tfOtdB/410XtsrDJO6T+VncZVqiN1lI6SGUizJzpXo6IgeYph5hstzHzif+6A
         LhzscpscS0c2AKGF+K4oJypxvBVS4j4/jAyFoJ6RVTZ3t1VmUcC7vqsn4xuEaT1by558
         pjZkR6ZIlUYRHM5IyuWYn/TF3f5FstuSfLlvWP0zB6BKdJ8f9Zsy1HPaAArIJwT9kpMY
         7bLP8jr8NjDxDLrQEaE+9aMHRCIpPOfXFKDkzHfHuIVpWNUfkXfwR1fRhqBCttM8LwhK
         e0n0YoKdm5f6+Rt/5NL+Y9yShp8l/16iwomdzYL6iasdRPGnT7a/FY0HpmfKwUqNAiW1
         mA0g==
X-Forwarded-Encrypted: i=1; AHgh+Rp0j34t/LiqBdOUs3pzgvC0vd3pU1bReqTX3BQsd6OVC0adtoWN3HX2c91jpC/Ui0kaTFNjpRIKSMa9vg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyN+St42PdNFvrDDMD6wcoTalHJBiaqwuVazUCPemYoUrTarkmn
	JMRYgUUvyqeIy2oQ6XHXUdQT2js1L4fZC6z/cb57kzIFM2nfPL5+1hYW5JHQgRpUjMyRjb996ga
	elpkoSd3tHxBKzJTrJg==
X-Received: from wmph7.prod.google.com ([2002:a05:600c:4987:b0:490:b2b0:c4aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3491:b0:493:c0ec:9a5f with SMTP id 5b1f17b1804b1-493df08ce7dmr67025965e9.19.1783432449607;
 Tue, 07 Jul 2026 06:54:09 -0700 (PDT)
Date: Tue, 7 Jul 2026 13:54:08 +0000
In-Reply-To: <20260703210936.1128698-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260703210936.1128698-1-dakr@kernel.org>
Message-ID: <ak0FAGpJtUH7VvHQ@google.com>
Subject: Re: [PATCH] rust: irq: make Registration compatible with
 lifetime-bound drivers
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, bhelgaas@google.com, 
	kwilczynski@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mhi@mailbox.org, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 03, 2026 at 11:09:21PM +0200, Danilo Krummrich wrote:
> -impl<T: ?Sized + Handler + Send> Handler for Arc<T> {
> -    fn handle(&self, device: &Device<Bound>) -> IrqReturn {
> -        T::handle(self, device)
> -    }
> -}
> -
> -impl<T: ?Sized + Handler, A: Allocator + 'static> Handler for Box<T, A> {
> -    fn handle(&self, device: &Device<Bound>) -> IrqReturn {
> -        T::handle(self, device)
> -    }

Why are the implementations for Arc/Box being removed?

Alice
