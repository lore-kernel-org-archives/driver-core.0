Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543415;
	b=qgreaIUvhNfpnf8XHH1fmfv/HLECL7AbYSUTBe7EAv8w4toNxAdQnXUTMzMqNhUISvmb
	 feeSt1+TzX8bJYFZDJHMWAOrApF3yX/Qh8cXeDOscMZkmgQb1nn+3QecVWKrYUOV4W/wA
	 3T8QUfyRfp0f5hBqK2YZ5s2+AAk4QafdqErauQP0afto1Zp1vhe9U8nqoa4ImoW2NKgRg
	 +RvNdJxspSlmHxWe3SX3fQo5IFpWaT//LqVoMKr654+YTh01O9AyumRvwx7EFdC4ViZm3
	 bJ4HZz4mbKQ2YocjhCr8VCV+H7uxddNPqUNs5698VR3qrQOlHVFxp3D5yRXdzLg9KEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NhTEfKWb6DbluRd1mldD3BYSLbGgDbbN8zaDAjpM6uw=;
	b=CbTwqla8XhbO+AoX8RY+zTHF0w69JVo8hi9jI9R6Ht83bU9Reg8/j0UZKJviJIR2TqOW
	 NAAQBSK9YC+nAXYHvex39EiScv0JXoPRJYmbeF6b7w1fJuO3gxvJH303PqtKiCCw4oXo4
	 t9/pIUPjZRJ6+o161HeAreCeoN8HcltFh1hVmTrRt313qC/MYnAfUM+tA/c1Q2xvX3PFU
	 hnB8eK3REej2UJZdw+jWqhpBT+qCAIe66tMWev0QeXqBHQ9tqhlQivY5Xnz4SUgt2wwnk
	 x8S0G//0dsePjpPVkhpnNkKrJq6OWj2lxOnGJFKAu//ph7ANOA4Eu0atdJ3OyVNBPLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lAqaTRNM;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4750606A327
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 18:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4750606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lAqaTRNM
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so1865482c88.1
        for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 10:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795543414; x=1796148214; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NhTEfKWb6DbluRd1mldD3BYSLbGgDbbN8zaDAjpM6uw=;
        b=lAqaTRNMsaoB2X4JdnC5Ko+7kI5vulLvS0HoYck/rHL6NvYsqoTCws5qQG2u7RQ7Ga
         bjGXARD/pM+rmShZtxqsa7eylZaUt4nD792NYpwdeQC15sKf9Qs6IKVzeGPwS2+O+6mY
         +78FN1W8cRH4a1f7hGQ1/xquukktVdgrB2B8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543414; x=1796148214;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhTEfKWb6DbluRd1mldD3BYSLbGgDbbN8zaDAjpM6uw=;
        b=zp38NmlKuiXzh+hvTjQIATSzXEWHDTUIV0j/YrhdNCIH9WJlQ90EOHaqM67vpgSzea
         9QABrwnbSeKAl1yCXHSLKUjZ4nZ/qVxnD3vrHx9xR3xStXCBZdOGt7tyuaf9Cer0u9QP
         UGJKI3tYwOf9mjExMzxiiCCbbtfu06GGAiQAMuyWYn5Gk7QJ9TcM2SFl798ESJc+C8Ql
         CwtOHtxOng0WuGdqiqpfZCI6218WKkpCedLL8/vmLxCFPQt93rjYx446z7iiaaVW4roX
         lAAqEGslndbRRslEdnhjFTIvgGioiiLQG6wadYudIRZ5tcp3SGAKePhEfSZouG0tsQnn
         nRWg==
X-Forwarded-Encrypted: i=1; AL+hErEmRSzxoT5AuLPKkAQNxSex7orw1t/n09PAwEdFmg/AN0O3+/CkPUiGX0JlwZBdmKaEq8zHEZ1E2Nqwig==@lists.linux.dev
X-Gm-Message-State: APuU4Z/YUA84OYV+XGt5Xxqdb0QoBvHZ3gMIbyP1ZIG8sbMwNE3XX7Kw
	dadu9AqHHfKknk/aaRkMZQomkiFkSJZFXP1K90nqwRVi8s8Y07w2/9HsFVfnfpbXKw==
X-Gm-Gg: AZFdTZfJwWIhL9cJWwLsQKLcU/cB+9agkHP2gnAKnh5WKE8iylpCMnxG7MUxcyr0EPN
	0iGyXaBhCiTXlz2yGKsuqtHlQuRz20HOdvUrVcjMn97FAlqr7311Prsj/TzRQXusxYetOr2GJDp
	WLdriCQtHtzP5vTrC1yhmdXPbBJDHx+rKtDuKDJxRginHaf+AwgUqZwIvtikiX+wDBmdPva5MPn
	lgSB3SgGak4SLCUx3fTzQFU0bhDdyS/AyVTEWFnAmNAV/2XQeH4Xj/XS/pX2wiWoTxNtHBTII97
	nEGP3N9v8DF39ial5wE7zNM6njH2MlFReppe/rZ9FbYcY7Bd5C4hjayKu62QOuqTxRrcrYGJwrH
	JWruSzsFHY6VNzr+pOTCDLOndGoRi6K/BLlkfedDTxOki3eqx84LiYP3rEdALtw1FrL6sx2zScC
	jyiB6i16X7dOhddiVfuuwXaS4QVwg6ZC+vq+s5r+8PrI6zGWw3NulDtSkCk3X/bQ+B1bbHVvG25
	k9zsMrh1vNaNGhkS+E6aEsiEZ58uGtb3S/nagdt+Arya//WRQeuwJeoS64sLAkOtuGAnop7LRsX
	HRaOd/R8FywGG9jN+P5ECO7n44BCLhujeMdYfvH6qvhpIrBOLx9NeadM8AGap4euX+HsF4KVoPN
	PbdZtf+KpVCj/xg==
X-Received: by 2002:a05:7023:a41:b0:1b2:649d:dc23 with SMTP id a92af1059eb24-1b556901b95mr16214334c88.35.1795543413661;
        Tue, 24 Nov 2026 10:03:33 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:6ad2:8ba0:aedd:5a84])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385666e99fdsm58381434eec.5.2026.11.24.10.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:03:33 -0800 (PST)
Date: Tue, 24 Nov 2026 10:03:31 -0800
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	Linux Driver Core Development <driver-core@lists.linux.dev>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v1] PM: runtime: Eliminate __pm_runtime_put_autosuspend()
Message-ID: <awXRc5mqhe6h6MGi@google.com>
References: <13014755.O9o76ZdvQC@rafael.j.wysocki>
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
In-Reply-To: <13014755.O9o76ZdvQC@rafael.j.wysocki>

On Tue, Nov 24, 2026 at 05:36:41PM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> There are two users of __pm_runtime_put_autosuspend(),
> pm_runtime_put_autosuspend() and arm_smmu_rpm_put(), but
> the latter duplicates the code from the former.
> 
> Fold __pm_runtime_put_autosuspend() into pm_runtime_put_autosuspend()
> and make arm_smmu_rpm_put() call the latter.
> 
> No intentional functional impact.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Ah, it's about time. I was thinking Prakash's patches would handle this
semi-naturally eventually, but they seem to be stalling.

Reviewed-by: Brian Norris <briannorris@chromium.org>
