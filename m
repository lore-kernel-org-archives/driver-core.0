Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431D6262808;
	Fri, 23 Jan 2026 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170685; cv=none; b=SZE82oHnkDAIHpMkeNd9RyBbQcXIo0XHwLWtNFa0bFh4rRk1gJKnC/eiEk7uUvvSRANkZs+tSGRZunp5kTxo+8kzF9m5QicDzM5q+IjnP/0dQuHnPvrOR+NwgglcbCk2JBPt9NW8sOeNldYUlWI6Qo4UgWfcOimFBeQ1geWLTsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170685; c=relaxed/simple;
	bh=4uarZVU2/pQ5rxEHxaHDG0OIe4K0Z3y8JHlPwjRsvw0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=KTiJmC9YKjhK9OpISRvsB/V6YuX0fxiDjNub+bzuOguwS8UVx2ydcRbHfyQ+hm4+40jc/TGZDcfmeju0ajF0IAxbG1wj/BpyzuPUFcPWBtL6wtgTvZ5xLM7E5CassuPXdD5GPkyqmae1+s2xl5BxZk2HiOmDCnfqFTvoyLwVYSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cK+C2t5O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cK+C2t5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D6AC4CEF1;
	Fri, 23 Jan 2026 12:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769170684;
	bh=4uarZVU2/pQ5rxEHxaHDG0OIe4K0Z3y8JHlPwjRsvw0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=cK+C2t5Oas3nFF6xAYAIQT00W+VkEmgoOWVqS6IZbGCvGygOKTN2+Tm99YT8xxa37
	 ABABcQNB7dNNb5yx068ZH3HGJf8y/GejMtPdCyfHF2uGj77uhhp4uZjTxkfFAUCoJ2
	 61jEsSeelKxMFfEDXU9C3xrcMK/Lgsc+yvanKdimCT3HjDPrNLPC0McxsRMOVbqff3
	 fQbePPWjdhvaK9NADVKmVEuY5PpwB1Q1xJw0eojKQ2KpIK2tOhUWaUdfu8RwNpkr+n
	 GmneiRBez8hQhQZ+w13jl4s6sxPxSwFydrT7UADXkGbnFlHqVDkkckdrKc+zOmwCtX
	 uVOiMufRAnhOw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 13:17:59 +0100
Message-Id: <DFVYNY1XJRGO.2FY7J9EP5FA39@kernel.org>
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <david.m.ertman@intel.com>, <ira.weiny@intel.com>, <leon@kernel.org>,
 <aliceryhl@google.com>, <daniel.almeida@collabora.com>,
 <abdiel.janulgue@gmail.com>, <robin.murphy@arm.com>,
 <a.hindborg@kernel.org>, <russ.weight@linux.dev>, <mcgrof@kernel.org>,
 <tj@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add missing T: entry for FIRMWARE
 LOADER
References: <20260120123925.28267-1-dakr@kernel.org>
 <20260120123925.28267-2-dakr@kernel.org>
In-Reply-To: <20260120123925.28267-2-dakr@kernel.org>

On Tue Jan 20, 2026 at 1:38 PM CET, Danilo Krummrich wrote:
> The firmware loader is maintained through the driver-core tree, hence
> add a corresponding T: entry.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to driver-core-testing, thanks!
