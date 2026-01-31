Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B45D1EDA0F;
	Sat, 31 Jan 2026 06:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769840635; cv=none; b=I6lL8xBUYRVvO9cG/Horwv3gQR2uDcx0qeLLmVlsM9TAaL/D1dswSGgEid5LSM2L5wshZHAENIE/10/BJu3oHQbdYIazJjQiI1yo5MOS0omfNcpMrp3f11Mm67NciMyw6706UfSiLn+wMZLApVZbvb0jNCZxskjNNuhL5k73+LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769840635; c=relaxed/simple;
	bh=XvwTMT9CXd+htliD1RrnQSfOkfwi7s+KmvQhF9HRSvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qG6LfgxQGy1U3MkEqBWzlFTgmG24WoW+Kgpm6GuybIIGHoAi7ntyogH/EmrWQkgyX4x3Uz5azv8NcDY+Ps34cKO8QMzom1SpoM9Tbfzc7DVvalRXwC98B0M1Wh7caLr0mCvN49ESzCPQJBqbmDgtJGHcBbkbMzNr7ohnsLNIuWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0TUgY4gr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0TUgY4gr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5E1C4CEF1;
	Sat, 31 Jan 2026 06:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769840635;
	bh=XvwTMT9CXd+htliD1RrnQSfOkfwi7s+KmvQhF9HRSvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0TUgY4grlbqSesU1Z9J7hR61Mm+d+bhCqET3nHd7Zsh7JA55iqwrXaCt+Gp9q2zzw
	 SHdGikFGL1xkCIrDD3NJGu0W24MBNiEOm66+bHVT4gjnY2f/Q42AeenSU9w9zigxfU
	 c5jFO6kT+2gjaMUjhA8cDe4qmO8oIFu7nDyPdYXQ=
Date: Sat, 31 Jan 2026 07:23:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, hanguidong02@gmail.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: fix inverted "locked" suffix of
 driver_match_device()
Message-ID: <2026013142-evaluate-width-50a9@gregkh>
References: <20260131014211.12841-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131014211.12841-1-dakr@kernel.org>

On Sat, Jan 31, 2026 at 02:42:07AM +0100, Danilo Krummrich wrote:
> In the current implementation driver_match_device() expects the device
> lock to be held, while driver_match_device_locked() acquires the device
> lock.
> 
> By convention it should be the other way around, hence swap the name of
> both functions.
> 
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
